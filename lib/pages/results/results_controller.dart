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
  }

  final imageDecoding = true.obs;
  final jpgEncoding = true.obs;
  final pngEncoding = true.obs;
  final jpgEncodingQueuing = true.obs;
  final pngEncodingQueuing = true.obs;
  final imageDecodingTime = 0.obs;
  final jpgEncodingTime = 0.obs;
  final pngEncodingTime = 0.obs;

  Future dartImageEnDec(String imageAddress) async {

    final aa = Stopwatch()..start();
    final decodedImage = decodeImage(File(imageAddress).readAsBytesSync());
    imageDecodingTime.value = aa.elapsed.inSeconds;
    print('\n > Image decoding took: ${imageDecodingTime.value} seconds');

    imageDecoding.value = false;

    jpgEncodingQueuing.value = false;

    final ab = Stopwatch()..start();
    encodeJpg(decodedImage);
    jpgEncodingTime.value = ab.elapsed.inSeconds;
    print('\n > Jpg encoding took: ${jpgEncodingTime.value} seconds');
    jpgEncoding.value = false;

    pngEncodingQueuing.value = false;

    final ac = Stopwatch()..start();
    encodePng(decodedImage);
    pngEncodingTime.value = ac.elapsed.inSeconds;
    print('\n > Png encoding took: ${pngEncodingTime.value} seconds');
    pngEncoding.value = false;

  }

}