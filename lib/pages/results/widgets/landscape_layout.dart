import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../results_controller.dart';

class LandscapeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: LandscapeLayoutBody(),
    );
  }
}

class LandscapeLayoutBody extends GetView<ResultsController> {
  @override
  Widget build(BuildContext context) {

    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      color: Color(0xFF737373),
      child: Obx(() => Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 50,
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 20 + statusBarHeight, right: 10, bottom: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dart\n"),
                  controller.dartImageDecoded.value == false
                      ? Text("Image decoding: ${controller.dartQueuingImageDecoding.value ? 'Queuing' : 'Processing'}\n")
                      : Text(
                      "Image decoding: ${controller.dartTimeOfImageDecoding.value} sec\n"),
                  controller.dartJpgEncoded.value == false
                      ? Text(
                      "Jpg encoding: ${controller.dartQueuingJpgEncoding.value ? 'Queuing' : 'Processing'}\n")
                      : Text(
                      "Jpg encoding: ${controller.dartTimeOfJpgEncoding.value} sec\n"),
                  controller.dartPngEncoded.value == false
                      ? Text(
                      "Png encoding: ${controller.dartQueuingPngEncoding.value ? 'Queuing' : 'Processing'}")
                      : Text(
                      "Png encoding: ${controller.dartTimeOfPngEncoding.value} sec")
                ],
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 20 + statusBarHeight, right: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Java\n"),
                  controller.javaImageDecoded.value == false
                      ? Text("Image decoding: ${controller.javaQueuingImageDecoding.value ? 'Queuing' : 'Processing'}\n")
                      : Text(
                      "Image decoding: ${controller.javaTimeOfImageDecoding.value} sec\n"),
                  controller.javaJpgEncoded.value == false
                      ? Text(
                      "Jpg encoding: ${controller.javaQueuingJpgEncoding.value ? 'Queuing' : 'Processing'}\n")
                      : Text(
                      "Jpg encoding: ${controller.javaTimeOfJpgEncoding.value} sec\n"),
                  controller.javaPngEncoded.value == false
                      ? Text(
                      "Png encoding: ${controller.javaQueuingPngEncoding.value ? 'Queuing' : 'Processing'}")
                      : Text(
                      "Png encoding: ${controller.javaTimeOfPngEncoding.value} sec")
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
