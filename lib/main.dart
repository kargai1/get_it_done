import 'package:flutter/material.dart';
import 'package:get_it_done/models/color_theme_data.dart';
import 'package:get_it_done/models/items_data.dart';
import 'package:get_it_done/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ItemData>(
        create: (BuildContext context) => ItemData()),
    ChangeNotifierProvider<ColorThemeData>(
      create: (BuildContext context) => ColorThemeData(),
    )
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Provider.of<ColorThemeData>(context).readyPref();
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ColorThemeData>(context).selectedThemeData,
      home: HomePage(),
    );
  }
}
