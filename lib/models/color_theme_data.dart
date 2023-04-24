import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorThemeData with ChangeNotifier {
  final ThemeData greenTheme = ThemeData(
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.green,
      accentColor: Colors.green,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(color: Colors.green),
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)));
  final ThemeData redTheme = ThemeData(
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.red,
      accentColor: Colors.red,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(color: Colors.red),
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)));

  ThemeData _selectedThemeData = ThemeData(
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.green,
      accentColor: Colors.green,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(color: Colors.green),
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)));

  bool _isGreen = true;
  static SharedPreferences? _sharedPref;
  bool get isGreen => _isGreen;

  void switchTheme(bool selected) {
    _isGreen = selected;
    savePref(selected);
    notifyListeners();
  }

  ThemeData get selectedThemeData => _isGreen ? greenTheme : redTheme;

  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void savePref(bool value) async {
    _sharedPref ??= await SharedPreferences.getInstance();
    await _sharedPref?.setBool('themeData', value);
  }

  void loadPref() async {
    _sharedPref ??= await SharedPreferences.getInstance();
    _isGreen = await _sharedPref?.getBool('themeData') ?? true;
  }
}
