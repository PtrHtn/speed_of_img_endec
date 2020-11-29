import 'dart:io';
import 'package:image/image.dart';
import 'package:get/get.dart';

class ResultsController extends GetxController{

  @override
  void onReady() {
    super.onReady();
    dartImageEnDec(Get.arguments[0]);
  }

  final imageDecoding = true.obs;
  final jpgEncoding = true.obs;
  final pngEncoding = true.obs;
  final imageEncodingWaiting = true.obs;
  final imageDecodingTime = 0.obs;
  final jpgEncodingTime = 0.obs;
  final pngEncodingTime = 0.obs;

  void dartImageEnDec(String imageAddress) async {

    final aa = new Stopwatch()..start();
    final decodedImage = decodeImage(File(imageAddress).readAsBytesSync());
    imageDecodingTime.value = aa.elapsed.inSeconds;
    print('\n > Image decoding took: ${imageDecodingTime.value} seconds');
    imageDecoding.value = false;

    imageEncodingWaiting.value = false;

    final ab = new Stopwatch()..start();
    encodeJpg(decodedImage);
    jpgEncodingTime.value = ab.elapsed.inSeconds;
    print('\n > Jpg encoding took: ${pngEncodingTime.value} seconds');
    jpgEncoding.value = false;

    final ac = new Stopwatch()..start();
    encodePng(decodedImage);
    pngEncodingTime.value = ac.elapsed.inSeconds;
    print('\n > Png encoding took: ${pngEncodingTime.value} seconds');
    pngEncoding.value = false;

  }

}