import 'package:dashboard_flutter/provider/app_profile_provider.dart';
import 'package:dashboard_flutter/services/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KFont {
  static final defaultTextStyle =
      Theme.of(Global.globalContext).textTheme.headline3;
}

class KDimens {
  static final headLine1 = 30.0;
  static final headLine2 = 25.0;
  static final headLine3 = 20.0;
  static final text = 17.0;
}

class KColor {
  static ThemeData get theme => Theme.of(Global.context);
  static bool get dark => Theme.of(Global.context).brightness==Brightness.dark;
  static Color get  main => theme.primaryColor;
  static Color get backGround => theme.backgroundColor;
  static Color textGrey = Colors.white60;
  static Color text = Colors.white;
  static Color  get leftActionItemBackground =>dark? theme.scaffoldBackgroundColor:Colors.blue;
}
