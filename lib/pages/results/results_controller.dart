import 'dart:io';
import 'package:image/image.dart';
import 'package:get/get.dart';

class ResultsController extends GetxController{

  @override
  void onReady() {
    super.onReady();
    dartImageEnDec(Get.arguments[0]);
  }

  final imageProcessing = true.obs;
  final imageDecodingTime = 0.obs;
  final imageEncodingTime = 0.obs;

  void dartImageEnDec(String imageAddress) async {

    final aa = new Stopwatch()..start();
    final decodedImage = decodeImage(File(imageAddress).readAsBytesSync());
    imageDecodingTime.value = aa.elapsed.inSeconds;
    print('\n > Image decoding took: ${imageDecodingTime.value} seconds');

    final ac = new Stopwatch()..start();
    encodePng(decodedImage);
    print('\n > Image encoding took: ${ac.elapsed.inSeconds} seconds');

    imageProcessing.value = false;
  }

}