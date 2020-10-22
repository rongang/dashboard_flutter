import 'package:dashboard_flutter/provider/base_provider.dart';
import 'package:flutter/material.dart';

class AppProfileProvider extends BaseProvider {
  static AppProfileProvider _appProfileProvider = AppProfileProvider();
  static AppProfileProvider get instance => _appProfileProvider;

  ThemeMode themeMode = ThemeMode.light;

  changeThemeMode() {
    themeMode = themeMode==ThemeMode.dark?ThemeMode.light:ThemeMode.dark;
    notifyListeners();
  }
}
