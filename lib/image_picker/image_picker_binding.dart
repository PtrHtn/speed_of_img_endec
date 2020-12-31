import 'package:get/get.dart';

import 'image_picker_controller.dart';

class ImagePickerBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ImagePickerController());
  }
}