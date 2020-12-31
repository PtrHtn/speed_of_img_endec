import 'package:flutter/material.dart';
import 'package:speed_of_img_endec/pages/results/results_widgets.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.landscape
          ? LandscapeLayout()
          : PortraitLayout();
    });
  }

}