import 'package:animation_course/widget/drawer_menu_widget.dart';
import 'package:flutter/material.dart';

class FirstDrawerPage extends StatelessWidget {
  final VoidCallback openDrawer;
  const FirstDrawerPage({Key? key ,required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,


        leading: DrawerMenuWidget(onClicked: openDrawer,),
        actions: [

        ],
        title: Text('FirstPage'),
      ),
    );
  }
}
