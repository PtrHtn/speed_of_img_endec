import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:get/get.dart';
import 'package:image/image.dart';

class ResultsController extends GetxController{

  String imageAddress;

  @override
  void onInit() {

    imageAddress = Get.arguments[0];

    super.onInit();

  }

  void imageResizing(String imageAddress) async {

    final aa = new Stopwatch()..start();

    final image = decodeImage(File(imageAddress).readAsBytesSync());
    final imageHeight = image.height;
    final newImageHeight = ((imageHeight / 100) * 80).round();
    final resizedImage = copyResize(image, height: newImageHeight);

    final Directory temporaryDirectory = await getTemporaryDirectory();
    final String temporaryImageDirectoryPath = '${temporaryDirectory.path}/images';
    Directory temporaryImageDirectory = Directory(temporaryImageDirectoryPath);
    if (await temporaryImageDirectory.exists() == false) {
    print('\n***\n > temporaryImageDirectory does NOT exist.\n***\n');
    } else {
    await temporaryImageDirectory.delete(recursive: true);
    print('\n***\n > Deleting existing temporaryImageDirectory.\n***\n');
    }
    temporaryImageDirectory = await Directory(temporaryImageDirectoryPath).create(recursive: true);
    final filteredImagePath = '$temporaryImageDirectoryPath/resizedImage.png';

    File(filteredImagePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(encodePng(resizedImage));
      // ..writeAsBytesSync(PngEncoder().encodeImage(resizedImage));

    print('\n > Saving of image took: ${aa.elapsed.inSeconds} seconds');
  }

}