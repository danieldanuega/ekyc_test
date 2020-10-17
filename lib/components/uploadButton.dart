import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class UploadButton extends StatelessWidget {
  final String title;

  UploadButton({this.title});

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      child: Text(title),
      style: NeumorphicStyle(
        lightSource: LightSource.topLeft,
        depth: 5,
      ),
      onPressed: () {},
    );
  }
}
