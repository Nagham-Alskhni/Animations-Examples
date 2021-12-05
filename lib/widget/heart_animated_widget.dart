import 'package:flutter/material.dart';

class HeartAnimatedwidget extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? onEnd;
  const HeartAnimatedwidget({Key? key , required this.child ,  this.duration = const Duration(milliseconds: 150) , required this.isAnimating  , this.onEnd}) : super(key: key);

  @override
  _HeartAnimatedwidgetState createState() => _HeartAnimatedwidgetState();
}

class _HeartAnimatedwidgetState extends State<HeartAnimatedwidget> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> scale;
  @override
  void initState() {
    // TODO: implement initState
    final half = widget.duration.inMilliseconds ~/2;
    controller = AnimationController(vsync: this , duration: Duration(milliseconds: half));
       scale = Tween<double>( begin: 1 , end: 1.2).animate(controller);
    super.initState();
  }
  @override
  void didUpdateWidget(covariant HeartAnimatedwidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(widget.isAnimating  != oldWidget.isAnimating){
      doAnimation();
    }
  }

Future doAnimation()async {
    if(widget.isAnimating){
      await controller.forward();
      await controller.reverse();
      if (widget.onEnd != null){
        widget .onEnd!();
      }
    }
}
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(  scale: scale,child: widget.child);
  }
}
