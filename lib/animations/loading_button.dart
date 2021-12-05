import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

enum ButtonsState { init, loading, done }

class _LoadingButtonState extends State<LoadingButton> {
  ButtonsState state = ButtonsState.init; // initliaze enum state
  bool isAnimating = true;
  bool loading = false;
  bool stretched = false;
  bool done = true;
  @override
  Widget build(BuildContext context) {
    final done = state == ButtonsState.done;
    final stretched = isAnimating ||state == ButtonsState.init;
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(30),
      child: AnimatedContainer(
        duration: Duration(seconds: 3),
        curve: Curves.easeIn,
        width: state == ButtonsState.init ? 450 :70,
        onEnd: (){
          setState(() {
          isAnimating = !isAnimating;
          });
        },
        height: 70,
        child:

        stretched ? buildButton() : buildSmallButton(done),
      ),
    ));
  }

  Widget buildButton() {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: StadiumBorder(),
          side: BorderSide(width: 2, color: Colors.indigo),
        ),
        onPressed: ()async {
          setState(() {
            state = ButtonsState.loading;
          });
          await Future.delayed(Duration(seconds: 3));  // sfter 3 miniute go to done state
          setState(() {
            state = ButtonsState.done;
          });
          await Future.delayed(Duration(seconds: 3));
setState(() {
  state = ButtonsState.init;

});

        },
        child: FittedBox(
          child: Text(
            'Submit',
            style: TextStyle(
                fontSize: 24,
                color: Colors.indigo,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600),
          ),
        ));
  }

  Widget firstButton() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontSize: 20),
          minimumSize: Size.fromHeight(72),
          shape: StadiumBorder(),
        ),
        child: loading
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : Text('LogIn'),
        onPressed: () async {
          if (loading) return;
          setState(() {
            loading = true;
          });
          await Future.delayed(Duration(seconds: 5));
          // if i want send request to the server
          // do async and await and change the state of bool
          setState(() {
            loading = false;
          });
        },
      ),
    );
  }

  Widget buildSmallButton(bool done) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.indigo,
      ),
      child: Center(
          child: done
              ? Icon(
                  Icons.done,
                  size: 50,
                  color: Colors.white,
                )
              : CircularProgressIndicator(
                  color: Colors.white,
                )),
    );
  }
}
