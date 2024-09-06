
import 'package:flutter/material.dart';

class MyColors {
  static const primaryColor = Color(0xFF357bf5);
  static const primaryLight = Color(0xFFb8ceff);
  static const primaryColdColor = Color(0xFF495e83);
  static const secondaryColor = Color(0xFFE8F8EF);
  static const grey = Color(0xFFADADAD);
  static const searchFieldColor = Color(0xFFe9eef6);
  static const textColor = Colors.black;
  static const errorColor = Colors.red;
  static const white = Colors.white;
  static const backgroundColor = Color(0xFFF8F8F8);
  static const toastColor = Color(0xFF2C2C2C);
  static const pdfViewBackground = Color(0xFFf0f0f0);
  static const pdfViewToolbar = Color(0xFFdbdcde);

}

extension ColorExtension on Color {
  String toHex() {
    return '#${value.toRadixString(16).substring(2).toUpperCase()}';
  }
}