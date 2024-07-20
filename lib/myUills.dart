

import 'dart:ui';

import 'package:flutter/cupertino.dart';

class myUtills{
  static var backgroundColor = const Color(0xff242c3B);
  static var buttonBackGround = const Color(0xff37B6E9);
  static var sliderDesignColor = const Color(0xff353F54);



  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static TextStyle textStyle(BuildContext context, double fontSizeFactor,Color color,FontWeight fontWeight) {
    double height = MediaQuery.of(context).size.height;

    return TextStyle(
      fontSize: height * fontSizeFactor,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static SizedBox textField(BuildContext context, String fieldName, Color color, FontWeight fontWeight, double size,TextAlign textAlign, {int maxLines = 1}) {
    return SizedBox(
      child: Text(
        fieldName,
        style: textStyle(
            context, size,
            color, fontWeight
        ),
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }

  static var endpoint = 'https://api.escuelajs.co/api/v1';
}
