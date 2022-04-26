import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String text;
  Color fontColor;
  double fontSize;
  FontWeight fontWeight;
  String fontFamily;
  TextOverflow textOverflow;

  TextAlign textAlign;

  AppText({
    required this.text,
    this.fontColor = Colors.white,
    this.fontSize = 15,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = '',
    this.textOverflow = TextOverflow.visible,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      textAlign: textAlign,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }
}
