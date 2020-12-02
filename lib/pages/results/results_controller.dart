import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image/image.dart';
import 'package:get/get.dart';

class ResultsController extends GetxController{

  static const MethodChannel methodChannel = const MethodChannel('speed_of_img_endec');

  @override
  void onReady() async {
    super.onReady();
    await dartImageEnDec(Get.arguments[0]);
    await javaImageEnDec(Get.arguments[0]);
  }

  final dartImageDecoded = false.obs;
  final dartJpgEncodingQueuing = true.obs;
  final dartPngEncodingQueuing = true.obs;
  final dartJpgEncoded = false.obs;
  final dartPngEncoded = false.obs;
  final dartTimeOfImageDecoding = 0.0.obs;
  final dartTimeOfJpgEncoding = 0.0.obs;
  final dartTimeOfPngEncoding = 0.0.obs;

  Future dartImageEnDec(String imageAddress) async {

    await Future.delayed(const Duration(milliseconds: 500));

    final aa = Stopwatch()..start();
    final decodedImage = decodeImage(File(imageAddress).readAsBytesSync());
    dartTimeOfImageDecoding.value = (aa.elapsed.inMilliseconds / 1000).toPrecision(1);
    print('\n > Image decoding took: ${dartTimeOfImageDecoding.value} seconds');

    dartImageDecoded.value = true;

    dartJpgEncodingQueuing.value = false;

    await Future.delayed(const Duration(milliseconds: 500));

    final ab = Stopwatch()..start();
    encodeJpg(decodedImage);
    dartTimeOfJpgEncoding.value = (ab.elapsed.inMilliseconds / 1000).toPrecision(1);
    print('\n > Jpg encoding took: ${dartTimeOfJpgEncoding.value} seconds');
    dartJpgEncoded.value = false;

    dartPngEncodingQueuing.value = false;

    await Future.delayed(const Duration(milliseconds: 500));

    final ac = Stopwatch()..start();
    encodePng(decodedImage);
    dartTimeOfPngEncoding.value = (ac.elapsed.inMilliseconds / 1000).toPrecision(1);
    print('\n > Png encoding took: ${dartTimeOfPngEncoding.value} seconds');
    dartPngEncoded.value = false;

  }

  Future javaImageEnDec(String imageAddress) async {

    await Future.delayed(const Duration(milliseconds: 500));

    final imageDecodingTime = await javaImageDecoding(imageAddress);
    print('\n > Java image decoding took: ${(imageDecodingTime / 1000).toPrecision(1)} seconds');
  }

  static Future<int> javaImageDecoding(String imageFilepath) async {
    return await methodChannel.invokeMethod(
        'imageDecoding',
        <String, dynamic>{'imageFilepath': imageFilepath}
        );
  }
}