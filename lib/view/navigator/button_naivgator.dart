import 'package:dashboard_flutter/view/body/component/icon_body.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerButton(
          // key: UniqueKey(),
          title: '组件页',
          expanded: widget.expanded,
          leading: Icon(Icons.whatshot),
          // isSelected: false,
          children: [
            LeftButton(
              title: 'Cupertino',
              press: () {
                widget.press(1.1);
                IconsBody.cupertinoIconsKey.currentState.changePage(0);
              },
            ),
            LeftButton(
              title: 'Material',
              press: () {
                widget.press(1.2);
                IconsBody.cupertinoIconsKey.currentState.changePage(1);
              },
            ),
          ],
        ),
        DrawerButton(
          // key: UniqueKey(),
          title: '动画',
          expanded: widget.expanded,
          leading: Icon(Icons.album_rounded),
          press: () {
            widget.press(2);
          },
          // isSelected: false,
        ),
      ],
    );
  }
}
