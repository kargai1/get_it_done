import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_it_done/models/items_data.dart';
import 'package:provider/provider.dart';

class ItemCart extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function(bool?) toggleStatus;
  final Function() removeItem;
  ItemCart(
      {super.key,
      required this.title,
      required this.isDone,
      required this.toggleStatus,
      required this.removeItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: removeItem,
      child: Card(
        color: isDone ? Colors.green.shade100 : Colors.white,
        elevation: isDone ? 1 : 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  decoration: isDone ? TextDecoration.lineThrough : null),
            ),
            trailing: Checkbox(
              onChanged: toggleStatus,
              value: isDone,
              activeColor: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
