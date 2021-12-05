


import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier{
  static final stonesPerRow = 3;
  static final rows = 6;
 // late List<GlobalKey> keys;

  static final double stoneMatch = 20;
  static final double stoneMatchRow =stoneMatch / 2 * stonesPerRow;

   AppState(){
    this.stoneHeight = 0;
 this.keys = List.generate(rows, (index) => GlobalKey<AnimatedListState>()) ;
  }

  late List<GlobalKey<AnimatedListState>> _keys;

  late double _stoneHeight;

  List<GlobalKey<AnimatedListState>> get keys => _keys;


  double get stoneHeight => _stoneHeight;
  set stoneHeight(double stoneHeight)=> _stoneHeight = stoneHeight;

  set keys (List<GlobalKey<AnimatedListState>> keys){
  _keys = keys;
  notifyListeners();
}

  determineStoneHeight(double stoneWidth){
    const originalStoneWidth= 640;
    const originalStoneHeight = 280;
    stoneHeight = stoneWidth / originalStoneWidth * originalStoneHeight;
  }
}