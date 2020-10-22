import 'package:dashboard_flutter/view/navigator/drawer_button.dart';
import 'package:flutter/material.dart';

class DrawerButtonLayout extends StatefulWidget {
  final Function(double) press;
  final bool expanded;

  const DrawerButtonLayout({Key key, this.press, this.expanded = true})
      : super(key: key);

  @override
  _DrawerButtonLayoutState createState() => _DrawerButtonLayoutState();
}

class _DrawerButtonLayoutState extends State<DrawerButtonLayout> {
  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerButton(
          title: '组件页',
          expanded: widget.expanded,
          leading: Icon(Icons.whatshot),
          // isSelected: false,
          children: [
            LeftButton(
              title: 'Cupertino',
              focusNode: focusNode1,
              press: () {
                widget.press(1.1);
              },
            ),
            LeftButton(
              title: 'Material',
              focusNode: focusNode2,
              press: () {
                widget.press(1.2);
              },
            ),

          ],
        ),
      ],
    );
  }
}