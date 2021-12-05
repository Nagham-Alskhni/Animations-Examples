import 'package:animation_course/animations/second_transition_page.dart';
import 'package:animation_course/model/custom_page_route.dart';
import 'package:flutter/material.dart';
class FirstTransitionPage extends StatelessWidget {
  const FirstTransitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Center(
        child:  Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 70,
          child:
          TextButton(
            child: Text('Click Here'),
            style: TextButton.styleFrom(
              primary: Colors.white,
              shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
              backgroundColor: Colors.teal,
              onSurface: Colors.grey,
            ),
            onPressed: () {
             Navigator.of(context).push(CustomPageRoute(child: SecondTransitionPage() , direction: AxisDirection.up ));
            },
          ),
        ),
      ) ,
    );
  }
}
