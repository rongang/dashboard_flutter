import 'package:flutter/material.dart';

class RightBodyLayout extends StatelessWidget {
  final List<Widget> children;

  const RightBodyLayout({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: children,
        ),
      ),
    );
  }
}