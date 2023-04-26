import 'dart:convert';

import 'package:flutter/widgets.dart';

main() {
  Item itemObject = Item(title: 'uyu', isDone: true);

  Map itemAsMap = itemObject.toMap();

  String itemAsJson = jsonEncode(itemAsMap);

  itemAsMap = jsonDecode(itemAsJson);
  // itemObject = Item(title: itemAsMap['title'], isDone: itemAsMap['isDone']);
  itemObject = Item.fromMap(itemAsMap);
}

class Item with ChangeNotifier {
  String? title;
  bool? isDone;

  Item({this.title, this.isDone});
  Item.fromMap(Map map)
      : title = map['title'],
        isDone = map['isDone'];

  Map<String, dynamic> toMap() => {'title': title, 'isDone': isDone};
}
