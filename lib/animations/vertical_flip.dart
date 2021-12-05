import 'package:flutter/material.dart';
import 'dart:math' as math;
class VerticalFlip extends StatefulWidget {
  final Image front ;
  final Image back;

  const VerticalFlip({
    required this.back, required this.front,
    Key? key})
      : super(key: key);

  @override
  _VerticalFlipState createState() => _VerticalFlipState();
}

class _VerticalFlipState extends State<VerticalFlip> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;
  bool isFront = true;
  double drag = 0;
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(vsync: this , duration: Duration(milliseconds: 500));
    controller.addListener(() {

      setState(() {
        drag = animation.value;
        setImageSide();
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var angle = drag/180 * math.pi ;
    final transform = Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(angle);
    return GestureDetector(
      onVerticalDragUpdate: (d){
        setState(() {
          drag+=d.delta.dy;
          drag%= 360;
          setImageSide();
        });

      },
      onVerticalDragEnd: (d){
        setState(() {
          final double end = isFront ?(drag > 180 ? 360 :0) : 180;
          animation = Tween<double>(begin: drag , end:end ).animate(controller);
          controller.forward(from: 0);
        });

      },
      child:
      Transform(
        transform: transform ,
        alignment: Alignment.center,
        child: isFront ?  widget.front : Transform(
            transform: Matrix4.identity()..rotateX(math.pi) ,
            alignment: Alignment.center,
            child:  widget.back),),
    );
  }
  void setImageSide(){
    if(drag<= 90 || drag>= 270){
      isFront = true;
    }else{
      isFront = false;
    }
  }
}