import 'package:flutter/material.dart';

 class SpeechBubbleClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    // throw UnimplementedError();

    final path = Path ();
// move to the middle
path.moveTo(size.width/2 , 0);


//line to end
    path.lineTo(size.width, 0);

    // first Curve down
    path.quadraticBezierTo(size.width/2, size.height, 0, size.height);


    // second Curve up
    path.quadraticBezierTo(size.width/2, size.height/2, size.width/2, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
    // // TODO: implement shouldReclip
    // throw UnimplementedError();
  }
}