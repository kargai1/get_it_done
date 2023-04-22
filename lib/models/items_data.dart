import 'package:flutter/material.dart';
import 'package:get_it_done/models/item.dart';

class ItemData extends ChangeNotifier {
  final List<Item> _items = [
    Item(title: 'peyniri al'),
    Item(title: 'sigara al'),
    Item(title: 'çöpü at')
  ];

  void toggleStatus(int index) {
    _items[index].toggleStatus();
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(
      Item(title: title),
    );
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  List<Item> get items => _items;
}
