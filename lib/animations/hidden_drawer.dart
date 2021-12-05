import 'package:animation_course/model/drawer_item.dart';
import 'package:animation_course/model/drawer_items.dart';
import 'package:animation_course/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'first_drawer_page.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  _HiddenDrawerState createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  late double xOffset;
  late double
      yOffset; // tanasob tardi 2za lrakam  ex 50 btkbar w 2za 200 btzghar
  late double scaleFactor; // 60% it takes 60 percent from its original size
  bool isDragging = false;
  late bool isDrawerOpen ;
  DrawerItem item = DrawerItems.home;
  @override
  void initState() {
    super.initState();
    closeDrawer();
    // openDrawer();
  }

  void openDrawer() {
    setState(() {
      xOffset = 230;
      yOffset = 150;
      scaleFactor = 0.6;
      isDrawerOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1; // it mean 100 / 100
      isDrawerOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          buildDrawer(),
          buildPage(),
        ],
      ),
      backgroundColor: Colors.blueAccent,
    );
  }

  Widget buildDrawer() {
    return SafeArea(child: Container(
      width: xOffset,
      child: DrawerWidget(
        onSelectedItem: (item){
        setState(() {
          this.item = item;
        });
        closeDrawer();

        },
      ),
    ));
  }

  Widget buildPage() {
    return WillPopScope(
      onWillPop: ()async{
        if(isDrawerOpen){
          closeDrawer();
          return false;

        }else{
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (d) {
          isDragging = true;
        },
        onHorizontalDragUpdate: (d){
          if(!isDragging)return;
          const delta = 1;
          if(d.delta.dx>delta){
            openDrawer();
          }else if(d.delta.dx < -delta){
            closeDrawer();
          }
isDragging = false;
        },
        child: AnimatedContainer(
            duration: Duration(
                milliseconds: 300), // how long this Animation should take

            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor), // to change the Position
            child: AbsorbPointer(
              absorbing: isDrawerOpen,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isDrawerOpen?30:0),
                child: Container(
                  color: isDrawerOpen ?Colors.white12 :Colors.blue,
                  child: GetDrawerWidget(),
                  // FirstDrawerPage(
                  //   openDrawer: openDrawer,
                  // ),
                ),
              ),
            )),
      ),
    );
  }
  Widget GetDrawerWidget(){
    switch(item){
      case DrawerItems.settings:
        return FirstDrawerPage(openDrawer: openDrawer);
      case DrawerItems.explore:
        return FirstDrawerPage(openDrawer: openDrawer);
      case DrawerItems.messages:
        return FirstDrawerPage(openDrawer: openDrawer);
      case DrawerItems.profile:
        return FirstDrawerPage(openDrawer: openDrawer);



      case DrawerItems.home:
      default: return FirstDrawerPage(openDrawer: openDrawer);

    }
  }
}
