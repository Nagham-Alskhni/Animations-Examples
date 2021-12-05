import 'package:animation_course/widget/speech_clipper.dart';
import 'package:flutter/material.dart';

class SpeechBubble extends StatelessWidget {
  final Widget child;
  const SpeechBubble({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 52, 16, 0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: child,
          ),
          Container(
              alignment: Alignment.topRight,
              child: ClipPath(
                clipper: SpeechBubbleClipper(),
                child: Container(
                  margin: EdgeInsets.only(right: 52),
                  color: Colors.white,
                  width: 80,
                  height: 40,
                ),
              )),
        ],
      ),
    );
  }
}
