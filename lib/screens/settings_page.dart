import 'package:flutter/material.dart';
import 'package:get_it_done/models/color_theme_data.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Your Theme'),
        ),
        body: SwitchCard());
  }
}

class SwitchCard extends StatefulWidget {
  const SwitchCard({super.key});

  @override
  State<SwitchCard> createState() => _SwitchCardState();
}

class _SwitchCardState extends State<SwitchCard> {
  @override
  Widget build(BuildContext context) {
    bool value = Provider.of<ColorThemeData>(context).isGreen;
    Text greenText =
        Text('Green', style: TextStyle(color: Theme.of(context).primaryColor));
    Text redText =
        Text('Red', style: TextStyle(color: Theme.of(context).primaryColor));
    return Card(
      child: SwitchListTile(
        title: Text(
          'Change Theme Color',
          style: TextStyle(color: Colors.black),
        ),
        subtitle: value ? greenText : redText,
        value: value,
        onChanged: (_) {
          Provider.of<ColorThemeData>(context, listen: false).switchTheme();
        },
      ),
    );
  }
}
