import 'dart:io';

import 'package:get/get.dart';
import 'package:image/image.dart';

class ResultsController extends GetxController{

  String imageAddress;

  @override
  void onInit() {
    super.onInit();

    imageAddress = Get.arguments[0];
  }

  void imageResizing(){

    final image = decodeImage(File(imageAddress).readAsBytesSync());
    final imageHeight = image.height;
    final newImageHeight = ((imageHeight / 100) * 80).round();
    final resizedImage = copyResize(image, height: newImageHeight);

    File('resizedImage.png').writeAsBytesSync(encodePng(resizedImage));
  }

}