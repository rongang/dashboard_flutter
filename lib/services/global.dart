import 'package:flutter/cupertino.dart';
import 'package:screen_utils/screen_utils.dart';

class Global{
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final overlay = navigatorKey.currentState.overlay;
  static final globalContext = navigatorKey.currentState.context;
  static BuildContext context;
  static init(){
    Adapt.init(globalContext);
  }
}