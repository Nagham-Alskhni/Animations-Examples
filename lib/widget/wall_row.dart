import 'package:animation_course/model/app_state.dart';
import 'package:animation_course/widget/brick_stone.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WallRow extends StatefulWidget {
    final  int index;
  final int countStone;
  const WallRow({Key? key,  this.index = 0,  this.countStone = 0}) : super(key: key);

  @override
  _WallRowState createState() => _WallRowState();
}

class _WallRowState extends State<WallRow> {
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      physics: NeverScrollableScrollPhysics(),
      key:widget.index ==0 ? GlobalKey<AnimatedListState>():Provider.of<AppState>(context).keys[widget.index],
      scrollDirection: Axis.horizontal,
      initialItemCount: widget.countStone,
      // primary: false,
      // padding: EdgeInsets.all(0),
      itemBuilder: (context , index , animation){
        return buildItem(animation , index);
      },
    );
  }

  Widget buildItem(Animation<double> animation , int index ) {
    return BrickStoneWidget(stoneMatch: AppState.stoneMatch * (index + 2) ,animation: animation, );
  }
}
