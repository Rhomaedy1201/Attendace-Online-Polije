import 'package:flutter/material.dart';

class MediaHelper {
  // Mendapatkan tinggi StatusBar
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).viewPadding.top;
  }

  // Mendapatkan lebar layar
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Mendapatkan tinggi layar
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}