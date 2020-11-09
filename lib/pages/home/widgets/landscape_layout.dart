import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class LandscapeLayoutBody extends StatelessWidget {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
            ),
            ImagePickerButton(
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
