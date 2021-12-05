import 'package:animation_course/animations/vertical_flip.dart';
import 'package:animation_course/widget/flib_card_class.dart';
import 'package:flutter/material.dart';
class CardAnimation extends StatefulWidget {
  const CardAnimation({Key? key}) : super(key: key);

  @override
  _CardAnimationState createState() => _CardAnimationState();
}

class _CardAnimationState extends State<CardAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: FlipCardClass(front:Image.asset('assets/images/front.png') ,back:Image.asset('assets/images/back.png') ,)

      ),
    );
  }
}

