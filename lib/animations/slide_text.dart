import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
class SlideText extends StatefulWidget {
  const SlideText({Key? key}) : super(key: key);

  @override
  _SlideTextState createState() => _SlideTextState();
}

class _SlideTextState extends State<SlideText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7AHbEXBO9twGFOFzIqSVDnxfNYV_S0IwIrg&usqp=CAU'),
            fit: BoxFit.fitHeight,
          ),
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(alignment: Alignment.center , child: buildAnimatedText('Hey You ')),
      ),

    );
  }

  Widget buildAnimatedText (String text){
    return Marquee(
      text: text ,
      style: TextStyle(fontSize: 48 , color: Colors.white),
      blankSpace: 30,
      velocity: 150,  // change speed of text , if we put -150 text slide from other Direction
      pauseAfterRound: Duration(seconds: 2),



    );
  }
}
