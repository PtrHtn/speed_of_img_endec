import 'package:flutter/material.dart';

import 'home_widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.landscape
          ? LandscapeLayout()
          : PortraitLayout();
    });
  }

}