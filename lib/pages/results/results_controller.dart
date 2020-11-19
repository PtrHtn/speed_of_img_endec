import 'package:get/get.dart';

class ResultsController extends GetxController{

  String imageAddress;

  @override
  void onInit() {
    super.onInit();

    imageAddress = Get.arguments[0];
  }

}