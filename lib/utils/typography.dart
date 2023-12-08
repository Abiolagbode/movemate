import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors.dart';

class TextStore {
  BuildContext appContext;

  TextStore(this.appContext);

  // Get context width
  double getWidth() {
    double cWidth = Get.size.width;
    return cWidth;
  }

  // Get context height
  double getHeight() {
    double cHeight = Get.size.height;
    return cHeight;
  }

  // Function to return percentage of width
  double pW(double percent) {
    return getWidth() * (percent / 100);
  }

  // Function to return percentage of height
  double pH(double percent) {
    return getHeight() * (percent / 100);
  }

  TextStyle createStyle(
      {double size = 9,
      FontWeight weight = FontWeight.w300,
      Color color = Colors.black,
      double letterSpacing = 0,
      Color background = Colors.transparent}) {
    TextStyle resultStyle = new TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: 1.5,
        fontFamily: 'Criqu',
        letterSpacing: letterSpacing,
        backgroundColor: background);

    return resultStyle;
  }

  TextStyle HeadingFontLarge({Color color = TEXT_COLOR}) {
    return createStyle(size: pW(5), weight: FontWeight.w500, color: color);
  }

  TextStyle BigHeading1({Color color = TEXT_COLOR}) {
    return createStyle(size: pW(7), weight: FontWeight.w500, color: color);
  }

  TextStyle ArticleFontExtraSmall(
      {Color color = TEXT_COLOR, Color background = Colors.transparent}) {
    return createStyle(
        size: pW(3),
        weight: FontWeight.w300,
        color: color,
        background: background);
  }

  TextStyle ArticleFontMedium({Color color = TEXT_COLOR}) {
    return createStyle(size: pW(4), weight: FontWeight.w300, color: color);
  }

  TextStyle ArticleFontLarge({Color color = TEXT_COLOR}) {
    return createStyle(size: pW(5), weight: FontWeight.w300, color: color);
  }

  TextStyle Subitle19SemiBold({Color color = TEXT_COLOR}) {
    return createStyle(
      size: 20,
      weight: FontWeight.w600,
      color: color,
    );
  }

  TextStyle Body13Regular({Color color = TEXT_COLOR}) {
    return createStyle(
      size: 14,
      weight: FontWeight.w400,
      color: color,
    );
  }

  TextStyle Body13SemiBold({Color color = TEXT_COLOR}) {
    return createStyle(
      size: 14,
      weight: FontWeight.w600,
      color: color,
    );
  }

  TextStyle Body13RegularUnderline({Color color = TEXT_COLOR}) {
    return createStyle(
      size: 14,
      weight: FontWeight.w400,
      color: color,
    );
  }

  TextStyle Body16SemiBold({Color color = TEXT_COLOR}) {
    return createStyle(
      size: 17,
      weight: FontWeight.w600,
      color: color,
    );
  }

  TextStyle Body16Regular({Color color = TEXT_COLOR}) {
    return createStyle(
      size: 16,
      weight: FontWeight.w400,
      color: color,
    );
  }

  TextStyle Capture11Regular({Color color = TEXT_COLOR}) {
    return createStyle(
      size: 12,
      weight: FontWeight.w400,
      color: color,
    );
  }
}
