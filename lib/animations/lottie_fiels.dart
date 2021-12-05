import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class LottieFiels extends StatefulWidget {
  const LottieFiels({Key? key}) : super(key: key);

  @override
  _LottieFielsState createState() => _LottieFielsState();
}

class _LottieFielsState extends State<LottieFiels> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(vsync: this , );
    controller.addStatusListener((status) {if(status == AnimationStatus.completed){Navigator.pop(context); controller.reset();} });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:
        Column(
          children: [
            Lottie.network('https://assets8.lottiefiles.com/packages/lf20_3ls8a1y5.json'),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
                textStyle: TextStyle(fontSize: 28),
              ),
              icon: Icon(Icons.delivery_dining),
              label: Text('Order'),
              onPressed: showDoneDialog

            )
          ],
        ),
      ),
    );
  }
  void showDoneDialog()=>showDialog(
    barrierDismissible: false,
      context: context,
      builder: (context)=> Center(
        child: Dialog(
          child: Container(
            height: 250,
            child: Column(
              children: [
                Lottie.asset('assets/images/done1.json' , repeat: false , controller: controller ,
                    onLoaded: (c){
                  controller.duration =  Duration(seconds: 3) ;
                controller.forward();}),
                // Lottie.network('https://assets1.lottiefiles.com/datafiles/Wv6eeBslW1APprw/data.json' ,
                //     repeat: false),
                Text('Enjoy your Meal'),

              ],
            ),
          ),
        ),
      ));
}
