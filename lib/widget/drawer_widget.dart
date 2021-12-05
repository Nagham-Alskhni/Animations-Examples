import 'package:animation_course/model/drawer_item.dart';
import 'package:animation_course/model/drawer_items.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;

  const DrawerWidget({Key? key ,required this.onSelectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildDrawerItems(context),
        ],
      ),
    );
  }

  Widget buildDrawerItems (BuildContext context){
    return Column(
      children: DrawerItems.all.map((item) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 22 , vertical: 8),
        leading:Icon(item.icon , color: Colors.white,) ,
        title: Text(item.title , style: TextStyle(color: Colors.white),),


        onTap: (){
          onSelectedItem(item);
        },
      )).toList(),
    );
  }
}
