import 'package:flutter/material.dart';
import 'package:get_it_done/screens/item_adder.dart';
import 'package:get_it_done/screens/settings_page.dart';
import 'package:provider/provider.dart';
import '../widgets/item_cart.dart';
import '../models/items_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsPage())),
            icon: Icon(Icons.settings),
          )
        ],
        title: Text('Get it done'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                child: Text(
                  '${Provider.of<ItemData>(context).items.length} Items',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Consumer<ItemData>(
                      builder: (context, ItemData, child) => Align(
                        alignment: Alignment.topCenter,
                        child: ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          itemCount: ItemData.items.length,
                          itemBuilder: (context, index) => ItemCart(
                            toggleStatus: (_) {
                              ItemData.toggleStatus(index);
                            },
                            isDone: ItemData.items[index].isDone,
                            title: ItemData.items[index].title!,
                            removeItem: () {
                              ItemData.removeItem(index);
                            },
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              context: context,
              builder: (context) => ItemAdder());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
