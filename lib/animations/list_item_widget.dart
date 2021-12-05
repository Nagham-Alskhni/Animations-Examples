import 'package:animation_course/model/list_item.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback? onClicked;
  const ListItemWidget(
      {Key? key,
      required this.item,
      required this.animation,
      required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      key: ValueKey(item.urlimage),
        sizeFactor: animation,
        child: buildItem()
    );
  }

  Widget buildItem() {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(item.urlimage),
        ),
        title: Text(
          item.title,
          style: TextStyle(color: Colors.black, fontSize: 22),
        ), // why he didnt need an index ????
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
            size: 32,
          ),
          onPressed: onClicked,
        ),
      ),
    );
  }
}
