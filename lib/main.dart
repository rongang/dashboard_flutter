import 'package:dashboard_flutter/provider/app_profile_provider.dart';
import 'package:dashboard_flutter/resource/base_color.dart';
import 'package:dashboard_flutter/services/global.dart';
import 'package:dashboard_flutter/view/layout/base_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProfileProvider.instance, lazy: false)
      ],
      builder: (context, child) {
        ThemeMode themeMode = context.watch<AppProfileProvider>().themeMode;
        return BasePage(themeMode: themeMode,);
      },
    );
  }
}

class BasePage extends StatefulWidget {
  final ThemeMode themeMode;

  const BasePage({Key key, this.themeMode}) : super(key: key);
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorKey: Global.navigatorKey,
      themeMode: widget.themeMode,
      darkTheme: getThemeDate(dark: true),
      theme: getThemeDate(),
      home: EmptyPage(),
    );
  }
}

class EmptyPage extends StatefulWidget {
  @override
  _EmptyPageState createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    Global.context = context;
    Global.init();
    return Scaffold(
      body: BaseLayout(title: 'Flutter Web Dashboard'),
    );
  }
}
