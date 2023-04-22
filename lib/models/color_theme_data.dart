import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData greenTheme = ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    accentColor: Colors.green,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(color: Colors.green),
    textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white)));
ThemeData redTheme = ThemeData(
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.red,
    accentColor: Colors.red,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(color: Colors.red),
    textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white)));

class ColorThemeData extends ChangeNotifier {
  late SharedPreferences pref;
  bool _isGreen = true;

  bool get isGreen => _isGreen;

  ThemeData get selectedThemeData => _isGreen ? greenTheme : redTheme;

  void switchTheme() {
    _isGreen = !_isGreen;
    setpref(_isGreen);
    notifyListeners();
  }

  Future<void> createPref() async {
    pref = await SharedPreferences.getInstance();
  }

  void setpref(bool value) {
    pref.setBool('themeData', value);
  }

  void getPref() {
    _isGreen = pref.getBool('themeData') ?? true;
  }
}
