import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  String imageAddress;


  Future onPressedImagePickerButton(BuildContext context) async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      allowedExtensions: ['jpg', 'png'],
    );

    if (result != null) {
      imageAddress = result.paths.map((path) => path).toString();

    }
  }

}