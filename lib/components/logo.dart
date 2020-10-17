import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicText(
      "cekid_",
      style: NeumorphicStyle(
        depth: 7,
      ),
      textStyle: NeumorphicTextStyle(
        fontSize: 170.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
