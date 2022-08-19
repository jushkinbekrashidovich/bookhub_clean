import 'package:flutter/material.dart';

class AppUtils {
  AppUtils._();

  /// padding
  static const kAllPadding8 = EdgeInsets.all(8);
  static const kAllPadding12 = EdgeInsets.all(12);
  static const kAllPadding16 = EdgeInsets.all(16);
  static const kAllPadding20 = EdgeInsets.all(20);
  static const kLeftPadding8 = EdgeInsets.only(left: 8);

  /// sized box
  static const kBox = SizedBox();
  static const kBoxHeight12 = SizedBox(height: 12);

  /// radius
  static const kBorderRadius8 = BorderRadius.all(Radius.circular(8));
  static const kBorderRadius10 = BorderRadius.all(Radius.circular(10));
  static const kBorderRadius12 = BorderRadius.all(Radius.circular(12));
  static const kBorderRadius16 = BorderRadius.all(Radius.circular(16));
  ///
  static const kRadius12 = Radius.circular(12);
  static const kRadius16 = Radius.circular(16);
}
