
import 'package:flutter/material.dart';
class VoteButton extends StatelessWidget {
  final String text;
  final VoidCallback onclick;
  const VoteButton({    required this.text, required this.onclick  ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text , style: TextStyle(color: Colors.blue),),
      style: TextButton.styleFrom(
        primary: Colors.white,
        // onPrimary: Colors.white,
        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      onPressed: () {
       onclick();
      },
    );
  }
}
