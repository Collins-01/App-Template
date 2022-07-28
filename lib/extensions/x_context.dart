import 'package:flutter/material.dart';

extension XContext on BuildContext {
  double get deviceHeight => MediaQuery.of(this).size.height;
  double get deviceWidth => MediaQuery.of(this).size.width;
  double percentageHeight([double percentage = 100]) =>
      MediaQuery.of(this).size.height *
      (percentage / 100); //* height * (50)/100
  double percentageWidth([double percentage = 100]) =>
      MediaQuery.of(this).size.width * (percentage / 100);
}
