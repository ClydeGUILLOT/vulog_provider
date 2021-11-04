import 'package:flutter/material.dart';

class UI extends ChangeNotifier {
  MaterialColor _primaryColor = Colors.amber;

  set themeColor(newColor) {
    _primaryColor = newColor;
    notifyListeners();
  }

  MaterialColor get primaryColor => _primaryColor;
}