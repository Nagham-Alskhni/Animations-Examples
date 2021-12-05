import 'package:animation_course/animations/first_transition_page.dart';
import 'package:animation_course/model/custom_page_route.dart';
import 'package:flutter/material.dart';

class SecondTransitionPage extends StatelessWidget {
  const SecondTransitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Welcome'),
            SizedBox(height: 400,),
            TextButton(
              child: Text('Back'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                backgroundColor: Colors.teal,
                onSurface: Colors.grey,
              ),
              onPressed: () {
                Navigator.of(context).push(CustomPageRoute(child: FirstTransitionPage() , direction: AxisDirection.right));
              },
            ),
          ],
        ),
      ),
    );
  }
}
