import 'package:flutter/widgets.dart';

class TextAboveButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: Text('Pick the image.',
          style: TextStyle(fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300),
          textAlign: TextAlign.center),
    );
  }
}