import 'package:get/get.dart';

import 'speed_results_controller.dart';

class SpeedResultsBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SpeedResultsController());
  }
}