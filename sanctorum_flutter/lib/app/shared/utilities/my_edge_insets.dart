

import 'package:flutter/cupertino.dart';

class MyEdgeInsets {
  static const standard = EdgeInsets.all(40.0);
  static const home = EdgeInsets.all(20.0);
  static const insideButton = EdgeInsets.symmetric(vertical: 6.0, horizontal: 30);



  static getInsetsBelowStatusBar(BuildContext context){
    return standard.copyWith(top: MediaQuery.of(context).padding.top + standard.top);
  }
}