import 'package:flutter/cupertino.dart';

class CustomPageRoute extends PageRouteBuilder{

  final Widget child;
  final AxisDirection direction;

  CustomPageRoute({  required this.child , this.direction = AxisDirection.right})
      : super(
      transitionDuration: Duration(seconds: 1),
      reverseTransitionDuration:  Duration(seconds: 1) ,
      pageBuilder: (context , animation , seondAnimation){return child;});

  @override
  Widget buildTransitions(BuildContext context , Animation<double> animation , Animation<double>  seondAnimation , Widget child  ){
    return
      SlideTransition(
      position: Tween<Offset>(
        begin: getBeginOffset(),// from the left
        end: Offset.zero ,
      ).animate(animation) ,
      child: child,);


  }
  Offset getBeginOffset(){
    switch (direction){
      case AxisDirection.up:
        return Offset(0, 1);
      case AxisDirection.down:
        return Offset(0, -1);
      case AxisDirection.right:
        return Offset(-1, 0);
      case AxisDirection.left:
        return Offset(1, 0);
    }
  }

}

// three Steps to custom Transition
//1 - create class that extends PageRouteBuilder
//2 - create Constructor with super that take pageBuilder: as argument
// 3 - override buildTransition method

// Kinds of Transition

// 1 -  ScaleTransition(
// scale: animation ,
// child: child
// );

// 2 -  SlideTransition(
//       position: Tween<Offset>(
//         begin: Offset(-1 , 0),  // from the left
//         end: Offset.zero ,
//       ).animate(animation) ,
//       child: child,);