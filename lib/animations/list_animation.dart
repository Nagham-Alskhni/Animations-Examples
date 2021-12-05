import 'package:animation_course/data/list_items.dart';
import 'package:animation_course/model/list_item.dart';
import 'package:flutter/material.dart';

import 'list_item_widget.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({Key? key}) : super(key: key);

  @override
  _ListAnimationState createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation> {
  final listKey = GlobalKey<AnimatedListState>();
  final List<ListItem> items = List.from(listItems);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: insertItem,
      ),
      body: AnimatedList(
        key:listKey ,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) {
          return ListItemWidget(
            // key: listKey,
            item: items[index],
            animation: animation,
            onClicked: () {
              removeItem(index);
            },
          );
        },
      ),
    );
  }

  void removeItem(int index) {
    final removedItem = items[index];
    items.removeAt(index);
    setState(() {
      print(items.length);
      listKey.currentState!.removeItem(
          index,
              (context, animation) => ListItemWidget(
              item: removedItem, animation: animation, onClicked: () {}));
    });

  }

  void insertItem() {
    final newIndex = 1;
    final newItem = ListItem(title: 'title', urlimage: '');
    items.insert(newIndex, newItem);
    listKey.currentState!.insertItem(newIndex);
  }
}
