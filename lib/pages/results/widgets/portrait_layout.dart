import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

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
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dart\n"),
                  controller.dartImageDecoded.value == false
                      ? Text("Image decoding: ${controller.dartQueuingImageDecoding.value ? 'Queuing' : 'Processing'}\n",
                    style: TextStyle(color: controller.dartQueuingImageDecoding.value ? Colors.red : Colors.orange ),)
                      : Text(
                      "Image decoding: ${controller.dartTimeOfImageDecoding.value} sec\n",
                    style: TextStyle(color: Colors.green),),
                  controller.dartJpgEncoded.value == false
                      ? Text(
                      "Jpg encoding: ${controller.dartQueuingJpgEncoding.value ? 'Queuing' : 'Processing'}\n",
                    style: TextStyle(color: controller.dartQueuingJpgEncoding.value ? Colors.red : Colors.orange ),)
                      : Text(
                      "Jpg encoding: ${controller.dartTimeOfJpgEncoding.value} sec\n",
                    style: TextStyle(color: Colors.green),),
                  controller.dartPngEncoded.value == false
                      ? Text(
                      "Png encoding: ${controller.dartQueuingPngEncoding.value ? 'Queuing' : 'Processing'}",
                    style: TextStyle(color: controller.dartQueuingPngEncoding.value ? Colors.red : Colors.orange ),)
                      : Text(
                      "Png encoding: ${controller.dartTimeOfPngEncoding.value} sec",
                    style: TextStyle(color: Colors.green),)
                ],
              ),
            ),
          ),
          controller.jumpingDots.value == false
          ? Container()
          : JumpingDotsProgressIndicator(
            numberOfDots: 22,
            color: Colors.white,
            fontSize: 25,
          ),
          Expanded(
            flex: 50,
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Java\n"),
                  controller.javaImageDecoded.value == false
                      ? Text("Image decoding: ${controller.javaQueuingImageDecoding.value ? 'Queuing' : 'Processing'}\n",
                    style: TextStyle(color: controller.javaQueuingImageDecoding.value ? Colors.red : Colors.orange ),)
                      : Text(
                      "Image decoding: ${controller.javaTimeOfImageDecoding.value} sec\n",
                    style: TextStyle(color: Colors.green),),
                  controller.javaJpgEncoded.value == false
                      ? Text(
                      "Jpg encoding: ${controller.javaQueuingJpgEncoding.value ? 'Queuing' : 'Processing'}\n",
                    style: TextStyle(color: controller.javaQueuingJpgEncoding.value ? Colors.red : Colors.orange ),)
                      : Text(
                      "Jpg encoding: ${controller.javaTimeOfJpgEncoding.value} sec\n",
                    style: TextStyle(color: Colors.green),),
                  controller.javaPngEncoded.value == false
                      ? Text(
                      "Png encoding: ${controller.javaQueuingPngEncoding.value ? 'Queuing' : 'Processing'}",
                    style: TextStyle(color: controller.javaQueuingPngEncoding.value ? Colors.red : Colors.orange ),)
                      : Text(
                      "Png encoding: ${controller.javaTimeOfPngEncoding.value} sec",
                    style: TextStyle(color: Colors.green),)
                ],
              ),
            ),
          )
        ],
      )),
      // ),
    );
  }
}
