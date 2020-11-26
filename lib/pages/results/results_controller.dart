import 'dart:io';
import 'package:image/image.dart';
import 'package:get/get.dart';

class ResultsController extends GetxController{

  @override
  void onReady() {
    super.onReady();
    imageResizing(Get.arguments[0]);
  }

  final imageProcessing = true.obs;

  void imageResizing(String imageAddress) async {

    final aa = new Stopwatch()..start();
    final decodedImage = decodeImage(File(imageAddress).readAsBytesSync());
    print('\n > Image decoding took: ${aa.elapsed.inSeconds} seconds');

    final ac = new Stopwatch()..start();
    encodePng(decodedImage);
    print('\n > Image encoding took: ${ac.elapsed.inSeconds} seconds');

    imageProcessing.value = false;
  }

}