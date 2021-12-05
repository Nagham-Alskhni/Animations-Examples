import 'package:animation_course/model/app_state.dart';
import 'package:animation_course/model/mood.dart';
import 'package:animation_course/widget/brick_stone.dart';
import 'package:animation_course/widget/speech_bubble.dart';
import 'package:animation_course/widget/vote_button.dart';
import 'package:animation_course/widget/wall_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AmericanElection extends StatefulWidget {
  const AmericanElection({Key? key}) : super(key: key);

  @override
  _AmericanElectionState createState() => _AmericanElectionState();
}

class _AmericanElectionState extends State<AmericanElection> {
  Mood mood = Mood.good;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trump VS Biden'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(flex: 6, child: buildElection()),
          Expanded(flex: 4, child: buildButton()),
        ],
      ),
    );
  }

  Widget buildElection() {
    final text = _getSpeechText(mood);
    return Stack(
      children: [
        Image.asset(
          'assets/images/vote.jpg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fitHeight,
        ),
        Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            alignment: Alignment.bottomCenter,
            child: buildTrump(mood)),
        SpeechBubble(
          child: text,
        ),
        Expanded(
          child: Column(
            children: [
              ...List.generate(
                AppState.rows,
                (index) => Container(
                    height: Provider.of<AppState>(context).stoneHeight,
                    child: WallRow(index: index,)),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildButton() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ...List.generate(AppState.rows, (index) => buildWall(index)),

              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VoteButton(text: 'Trump Win', onclick: (){}),
                  VoteButton(text: 'Biden Win', onclick: (){})

                ],
              )),


        ],
      ),
    );
  }

  Widget buildWall( int index){
    return LayoutBuilder(builder: (context , constraints){
      final stoneHeight = 65.0;
      final items = (constraints.maxHeight / stoneHeight).round();
      final lastStoneHeight = constraints.maxHeight % stoneHeight;
      return Column(
        children: List.generate(items, (index) {
          final isLastItem = items -1 == index;
          return Container(
            height:  isLastItem ? lastStoneHeight : stoneHeight,
            child: WallRow(countStone: 2,),
          );
        }),
      );


    });
  }

  Widget _getSpeechText(Mood mood) {
    switch (mood) {
      case Mood.great:
        return Text(
          'I will win for sure!',
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        );
      case Mood.good:
        return Text(
          'I will win. These Wall won\'t stop me from tweeting',
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        );
      case Mood.bad:
        return Text(
          'Noooo Please stop - seriously I will give up',
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        );
      default:
        return Text('');
    }
  }

  Widget buildTrump(Mood mood) {
    switch (mood) {
      case Mood.great:
        return Image.asset(
          'assets/images/happy.jpg',
          width: double.infinity,
          fit: BoxFit.cover,
        );
      case Mood.good:
        return Image.asset(
          'assets/images/good.png',
          width: double.infinity,
          fit: BoxFit.cover,
        );
      case Mood.bad:
        return Image.asset(
          'assets/images/angry.png',
          width: double.infinity,
          fit: BoxFit.cover,
        );
      default:
        return Container();
    }
  }
}
