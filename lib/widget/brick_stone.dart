import 'package:animation_course/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class BrickStoneWidget extends StatelessWidget {
  final Animation <double>animation;
  final double stoneMatch;
  const BrickStoneWidget({required this.stoneMatch, required this.animation ,Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<AppState>(context);
    final stoneWidth = width /3 + AppState.stoneMatchRow;

    if(provider.stoneHeight == 0){
      provider.determineStoneHeight(stoneWidth);
    }

    return Container(
      width: stoneWidth,
      // height: 40,
      child: ScaleTransition(
        scale: animation,
        child: Stack(
          children: [
            Positioned(
              left: -stoneMatch,
              bottom: 0,
              child: Image.asset(
                'assets/images/stone.png',  fit: BoxFit.cover, width: stoneWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




























