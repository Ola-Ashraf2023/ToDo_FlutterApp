import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  changeTheme(ThemeMode temp) {
    mode = temp;
    notifyListeners();
  }
}
