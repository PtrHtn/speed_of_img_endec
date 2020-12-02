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

  final dartQueuingImageDecoding = true.obs;
  final dartQueuingJpgEncoding = true.obs;
  final dartQueuingPngEncoding = true.obs;
  final dartImageDecoded = false.obs;
  final dartJpgEncoded = false.obs;
  final dartPngEncoded = false.obs;
  final dartTimeOfImageDecoding = 0.0.obs;
  final dartTimeOfJpgEncoding = 0.0.obs;
  final dartTimeOfPngEncoding = 0.0.obs;

  final javaQueuingImageDecoding = true.obs;
  final javaImageDecoded = false.obs;
  final javaTimeOfImageDecoding = 0.0.obs;


  Future dartImageEnDec(String imageAddress) async {

    dartQueuingImageDecoding.value = false;

    await Future.delayed(const Duration(milliseconds: 500));

    final aa = Stopwatch()..start();
    final decodedImage = decodeImage(File(imageAddress).readAsBytesSync());
    dartTimeOfImageDecoding.value = (aa.elapsed.inMilliseconds / 1000).toPrecision(1);
    print('\n > Image decoding took: ${dartTimeOfImageDecoding.value} seconds');

    dartImageDecoded.value = true;

    dartQueuingJpgEncoding.value = false;

    await Future.delayed(const Duration(milliseconds: 500));

    final ab = Stopwatch()..start();
    encodeJpg(decodedImage);
    dartTimeOfJpgEncoding.value = (ab.elapsed.inMilliseconds / 1000).toPrecision(1);
    print('\n > Jpg encoding took: ${dartTimeOfJpgEncoding.value} seconds');
    dartJpgEncoded.value = true;

    dartQueuingPngEncoding.value = false;

    await Future.delayed(const Duration(milliseconds: 500));

    final ac = Stopwatch()..start();
    encodePng(decodedImage);
    dartTimeOfPngEncoding.value = (ac.elapsed.inMilliseconds / 1000).toPrecision(1);
    print('\n > Png encoding took: ${dartTimeOfPngEncoding.value} seconds');
    dartPngEncoded.value = true;

  }

  Future javaImageEnDec(String imageAddress) async {

    javaQueuingImageDecoding.value = false;

    await Future.delayed(const Duration(milliseconds: 500));

    javaTimeOfImageDecoding.value = (await javaImageDecoding(imageAddress) / 1000).toPrecision(1);
    print('\n > Java image decoding took: ${javaTimeOfImageDecoding.value} seconds');

    javaImageDecoded.value = true;
  }

  static Future<int> javaImageDecoding(String imageFilepath) async {
    return await methodChannel.invokeMethod(
        'imageDecoding',
        <String, dynamic>{'imageFilepath': imageFilepath}
        );
  }
}