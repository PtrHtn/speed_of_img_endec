import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_of_img_endec/pages/home/home_controller.dart';

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
      child: Container(
        margin: EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  controller.imageDecoding.value
                      ? Text("Image decoding: Processing\n")
                      : Text("Image decoding: ${controller.imageDecodingTime.value} seconds\n"),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
