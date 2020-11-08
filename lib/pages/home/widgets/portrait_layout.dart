
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              '  Speed of image En/Dec',
            ),
          ],
        ),
      ),
      body: PortraitLayoutBody(),
    );

  }
}

class PortraitLayoutBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}