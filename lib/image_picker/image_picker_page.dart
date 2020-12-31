import 'package:flutter/material.dart';

import 'image_picker_widgets.dart';

class ImagePickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.landscape
          ? ImagePickerLandscapeLayout()
          : ImagePickerPortraitLayout();
    });
  }

}