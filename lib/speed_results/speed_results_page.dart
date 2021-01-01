import 'package:flutter/material.dart';

import 'speed_results_widgets.dart';

class SpeedResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.landscape
          ? SpeedResultsLandscapeLayout()
          : SpeedResultsPortraitLayout();
    });
  }

}