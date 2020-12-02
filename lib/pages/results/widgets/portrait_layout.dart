import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../results_controller.dart';

class PortraitLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '  Results',
            ),
          ],
        ),
      ),
      body: PortraitLayoutBody(),
    );
  }
}

class PortraitLayoutBody extends GetView<ResultsController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373),
      child: Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 50,
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dart\n\n"),
                  controller.dartImageDecoded.value == false
                      ? Text("Image decoding: ${controller.dartQueuingImageDecoding.value ? 'Queuing' : 'Processing'}\n")
                      : Text(
                      "Image decoding: ${controller.dartTimeOfImageDecoding.value} seconds\n"),
                  controller.dartJpgEncoded.value == false
                      ? Text(
                      "Jpg encoding: ${controller.dartQueuingJpgEncoding.value ? 'Queuing' : 'Processing'}\n")
                      : Text(
                      "Jpg encoding: ${controller.dartTimeOfJpgEncoding.value} seconds\n"),
                  controller.dartPngEncoded.value == false
                      ? Text(
                      "Png encoding: ${controller.dartQueuingPngEncoding.value ? 'Queuing' : 'Processing'}")
                      : Text(
                      "Png encoding: ${controller.dartTimeOfPngEncoding.value} seconds")
                ],
              ),
            ),
          ),
        ],
      )),
      // ),
    );
  }
}
