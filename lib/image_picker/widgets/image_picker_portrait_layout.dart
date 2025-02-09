
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../image_picker_controller.dart';
import '../image_picker_widgets.dart';

class ImagePickerPortraitLayout extends StatelessWidget {
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
              '  Speed of image En/Dec',
            ),
          ],
        ),
      ),
      body: ImagePickerPortraitLayoutBody(),
    );

  }
}

class ImagePickerPortraitLayoutBody extends GetView<ImagePickerController>{
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xFF737373),
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .cardColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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