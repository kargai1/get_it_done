import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get_it_done/models/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemData extends ChangeNotifier {
  final List<Item> _items = [
    Item(title: 'peyniri al'),
    Item(title: 'sigara al'),
    Item(title: 'çöpü at')
  ];

  void toggleStatus(int index) {
    _items[index].toggleStatus();
    savePref(_items);
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(
      Item(title: title),
    );
    savePref(_items);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    savePref(_items);
    notifyListeners();
  }

  List<Item> get items => _items;

  static SharedPreferences? _sharedPref;

  List<String> _itemsAsString = [];

  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void savePref(List<Item> items) async {
    _sharedPref ??= await SharedPreferences.getInstance();
    _itemsAsString.clear();

    for (var item in items) {
      _itemsAsString.add(jsonEncode(item.toMap()));
    }

    _sharedPref?.setStringList('toDoData', _itemsAsString);
  }

  void loadPref() async {
    _sharedPref ??= await SharedPreferences.getInstance();
    List<String>? tempList = _sharedPref?.getStringList('toDoData') ?? [];
    _items.clear();
    for (var item in tempList!) {
      _items.add(Item.fromMap(jsonDecode(item)));
    }
  }
}
