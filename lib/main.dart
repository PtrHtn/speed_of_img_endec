import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'image_picker/image_picker_binding.dart';
import 'image_picker/image_picker_page.dart';

void main() {
  runApp(SpeedOfImageEcDecApp());
}

class SpeedOfImageEcDecApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Speed of image EnDec',
      theme: ThemeData.dark(),
      initialRoute: '/home_page',
      getPages: [
        GetPage(name: '/home_page', page: () => ImagePickerPage(), binding: ImagePickerBinding()),
        GetPage(name: '/results_page', page: () => ResultsPage(), binding: ResultsBinding()),
      ],
    );
  }
}
