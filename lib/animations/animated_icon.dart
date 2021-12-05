import 'package:flutter/material.dart';

class AnimateIcon extends StatefulWidget {
  const AnimateIcon({Key? key}) : super(key: key);

  @override
  _AnimateIconState createState() => _AnimateIconState();
}

class _AnimateIconState extends State<AnimateIcon> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this , duration: Duration(milliseconds: 1000));

  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: IconButton(
          iconSize: 150,
          onPressed: toggleIcon,
          splashColor: Colors.pink,
          icon: AnimatedIcon(

            icon: AnimatedIcons.play_pause, progress: controller,
          ),
        ),
      ),
    );
  }
  void toggleIcon(){
    setState(() {
      isPlaying = ! isPlaying;
      isPlaying ? controller.forward() : controller.reverse();
    });
  }
}
