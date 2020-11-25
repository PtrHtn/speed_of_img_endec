import 'dart:io';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';

class ResultsController extends GetxController{

  @override
  void onReady() {
    super.onReady();
    imageResizing(Get.arguments[0]);
  }

  final imageProcessing = true.obs;

  void imageResizing(String imageAddress) async {

    final Directory temporaryDirectory = await getTemporaryDirectory();
    final String temporaryImageDirectoryPath = '${temporaryDirectory.path}/images';
    Directory temporaryImageDirectory = Directory(temporaryImageDirectoryPath);
    if (await temporaryImageDirectory.exists() == true) {
      await temporaryImageDirectory.delete(recursive: true);
    }
    temporaryImageDirectory = await Directory(temporaryImageDirectoryPath).create(recursive: true);
    final filteredImagePath = '$temporaryImageDirectoryPath/resizedImage.png';

    final decodedImage = decodeImage(File(imageAddress).readAsBytesSync());

    var encodedPngImage = encodePng(decodedImage);

  }

}