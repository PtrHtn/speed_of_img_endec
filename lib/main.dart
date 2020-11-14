import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'pages/home/home_binding.dart';
import 'pages/home/home_page.dart';
import 'pages/results/results_binding.dart';
import 'pages/results/results_page.dart';

void main() {
  runApp(SpeedOfImageEcDecApp());
}

class SpeedOfImageEcDecApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Image Averaging',
      theme: ThemeData.dark(),
      initialRoute: '/home_page',
      getPages: [
        GetPage(name: '/home_page', page: () => HomePage(), binding: HomeBinding()),
        GetPage(name: '/results_page', page: () => ResultsPage(), binding: ResultsBinding()),
      ],
    );
  }
}
