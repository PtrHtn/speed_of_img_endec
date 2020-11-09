import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePickerButton extends StatelessWidget {
  ImagePickerButton({@required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        backgroundColor: Get.theme.buttonColor,
        child: Icon(
          Icons.add_photo_alternate,
          size: 48,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
