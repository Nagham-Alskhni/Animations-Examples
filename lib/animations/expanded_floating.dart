import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AnimatedFloating extends StatefulWidget {
  const AnimatedFloating({Key? key}) : super(key: key);

  @override
  _AnimatedFloatingState createState() => _AnimatedFloatingState();
}

class _AnimatedFloatingState extends State<AnimatedFloating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade300,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close ,
        overlayColor: Colors.black,
        backgroundColor: Colors.black,
        overlayOpacity: 0.4,
        closeManually: true,
        children: [
          SpeedDialChild(
            child: Icon(Icons.mail),
            label: 'Mail',
            onTap: (){
              setState(() {
                print('mail');

                showToast('mail ');
              });

            }
          ),
          SpeedDialChild(
              child: Icon(Icons.copy),
              label: 'Copy'
              
          ),

          SpeedDialChild(
              child: Icon(Icons.copy),
              label: 'Copy',
            onTap: (){
                print('hey');
            }

          ),

        ],
      ),

    );
  }
   showToast(String message){
    Fluttertoast.showToast(msg: message , fontSize: 20 , backgroundColor: Colors.black , textColor: Colors.white);
  }
}
