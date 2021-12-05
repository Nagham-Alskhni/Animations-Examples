import 'dart:async';

import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  const CountDown({Key? key}) : super(key: key);

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  static const countDownDuration = Duration(minutes: 10);


  Duration duration = Duration();
  Timer ? timer;
  bool isCountDown = true;
  @override
  void initState() {
    // TODO: implement initState
    // startTimer();
    reset();
    super.initState();
  }
  void reset(){
    if(isCountDown){
      duration = countDownDuration;
    }else{
      setState(() {
        duration = Duration();  // set it to 0
      });
    }


  }

  void addTime(){
    final addSeconds =  isCountDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if(seconds <0){
          timer?.cancel();
      }else{
        duration = Duration(seconds: seconds);
      }

    });
  }
  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (timer) {addTime(); });
    print('start');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            buildTime(),
            SizedBox(height: 80,),
            buildButtons(),
          ],
        ),
      ),
    );

  }
  Widget buildTime(){
    String twoDigits(int n)=>n.toString().padLeft(2 , '0') ;// convert 9 into 09
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTimeCard(time: hours, header: ' Hours'),
          SizedBox(width: 8,),

          buildTimeCard(time: minutes, header: ' Minutes'),
          SizedBox(width: 8,),
          buildTimeCard(time: seconds, header: 'Seconds')

        ],
      ),
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
        Text(header , style: TextStyle(color: Colors.white),)
      ],
    );

  }
  Widget ButtonWidget({required String text , required Color color , required  Function onClicking}){
    return  ElevatedButton(
      child: Text(text),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),


      onPressed:  (){},

    );


  }
  Widget buildButtons(){
    final isRunning = false;
    return isRunning ?
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonWidget(text: 'Stop' , onClicking: (){} , color: Colors.white),
        ButtonWidget(text: 'Cancel' , onClicking: (){} , color: Colors.white),
      ],
    ) : ButtonWidget(text: 'StartTimer' , onClicking: (){
      setState(() {
        startTimer();

      });
    } , color: Colors.white);
  }
}