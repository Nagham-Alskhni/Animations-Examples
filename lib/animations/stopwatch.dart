import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  Duration duration = Duration();
  Timer ? timer;
  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }
  void addTime(){
    final addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
    });
  }
  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (timer) {addTime(); });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: buildTime(),
      ),
    );

  }
  Widget buildTime(){
    String twoDigits(int n)=>n.toString().padLeft(2 , '0') ;// convert 9 into 09
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(time: hours, header: ' Hours'),
        SizedBox(width: 8,),

        buildTimeCard(time: minutes, header: ' Minutes'),
        SizedBox(width: 8,),
        buildTimeCard(time: seconds, header: 'Seconds')

      ],
    );
  }
  Widget buildTimeCard( {required String time , required String header} ){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(20)),
            child: Text(time ,
              style: TextStyle
              (color: Colors.black , fontWeight: FontWeight.bold , fontSize: 72),
            )),
        SizedBox(height: 20,),
        Text(header , style: TextStyle(color: Colors.white),),
        SizedBox(height: 20,),
      ],
    );

  }
}

