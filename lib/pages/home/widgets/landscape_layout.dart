import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';
import '../home_widgets.dart';

class LandscapeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: LandscapeLayoutBody(),
    );
  }
}

class LandscapeLayoutBody extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {

    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      color: Color(0xFF737373),
      child: Container(
        // margin: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 20, top: 20 + statusBarHeight, right: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
            ),
            TextAboveButton(),
            ImagePickerButton(
              onPressed: () async => controller.onPressedImagePickerButton(context),
            ),
          ],
        ),
      ),
    );
  }
}
