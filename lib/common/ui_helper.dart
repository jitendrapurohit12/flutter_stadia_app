import 'package:flutter/material.dart';
import 'package:flutter_stadia_app/style_guide/text_style.dart';

Widget contentHeading(String heading) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: Text(
      heading,
      style: headingOneTextStyle,
    ),
  );
}
