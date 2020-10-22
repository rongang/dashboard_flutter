import 'package:dashboard_flutter/resource/res.dart';
import 'package:flutter/material.dart';

class DrawerButton extends StatefulWidget {
  final String title;
  final bool expanded;
  final Icon leading;
  final Icon trailing;
  final bool isSelected;
  final List<LeftButton> children;

  const DrawerButton({
    Key key,
    this.title,
    this.expanded = true,
    this.leading,
    this.trailing,
    this.isSelected = false,
    this.children,
  }) : super(key: key);

  @override
  _DrawerButtonState createState() => _DrawerButtonState();
}

class _DrawerButtonState extends State<DrawerButton> {
  Color textColor = KColor.textGrey;
  Icon leading;
  bool isSelected;

  @override
  void initState() {
    super.initState();
    leading = widget.leading;
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    final noChildren = (widget.children == null || widget.children.length <= 0);
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 500),
      firstChild: TweenAnimationBuilder(
        duration: Duration(milliseconds: 100),
        tween: ColorTween(begin: KColor.backGround, end: textColor),
        builder: (context, value, child) {
          return InkWell(
            onHover: (v) {
              setState(() {
                textColor = v ? KColor.text : KColor.textGrey;
              });
            },
            onTap: () {
              print('Pressed');
            },
            child: AbsorbPointer(
              absorbing: widget.children == null,
              child: ExpansionTile(
                onExpansionChanged: (v) {
                  isSelected = v ? true : false;
                  setState(() {});
                },
                title: Row(
                  children: [
                    if (widget.leading != null)
                      Icon(
                        widget.leading.icon,
                        color: isSelected ? KColor.text : value,
                      ),
                    ParentLeftButton(
                      title: widget.title,
                      color: isSelected ? KColor.text : value,
                    ),
                  ],
                ),
                trailing: widget.trailing ??
                    Opacity(
                      opacity: noChildren ? 0 : 1,
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: isSelected ? KColor.text : value,
                      ),
                    ),
                backgroundColor: KColor.leftActionItemBackground,
                children: noChildren ? const <Widget>[] : widget.children,
              ),
            ),
          );
        },
      ),
      crossFadeState: widget.expanded
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      secondChild: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Icon(
            Icons.event,
            color: KColor.textGrey,
          ),
        ),
      ),
    );
  }
}

class ParentLeftButton extends StatelessWidget {
  const ParentLeftButton({
    Key key,
    this.title,
    this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(bottom: 3.0),
        child: Text(
          title,
          style: KFont.defaultTextStyle.copyWith(
            color: color,
            fontSize: KDimens.text,
          ),
        ),
      ),
    );
  }
}

class LeftButton extends StatefulWidget {
  const LeftButton({
    Key key,
    this.title,
    this.color,
    this.isSelected = false,
    this.focusNode,
    this.press,
  }) : super(key: key);

  final String title;
  final Color color;
  final bool isSelected;
  final FocusNode focusNode;
  final Function press;

  @override
  _LeftButtonState createState() => _LeftButtonState();
}

class _LeftButtonState extends State<LeftButton> {
  Color color = KColor.textGrey;
  bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusNode: widget.focusNode,
      autofocus: true,
      onHover: (v) {
        setState(() {
          color = v ? KColor.text : KColor.textGrey;
        });
      },
      onTap: () {
        isSelected = true;
        print('子组件点击');
        widget.focusNode.requestFocus();
        setState(() {});
        widget.press();

      },
      onFocusChange: (v) {
        isSelected = v;
        setState(() {});
      },
      child: TweenAnimationBuilder(
        duration: Duration(milliseconds: 100),
        tween: ColorTween(begin: KColor.textGrey, end: color),
        builder: (context, value, child) {
          return Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 3.0),
              child: Text(
                widget.title,
                style: KFont.defaultTextStyle.copyWith(
                  color: isSelected ? KColor.text : color,
                  fontSize: KDimens.text,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DrawerButtonEntity {
  String title;
  IconData icon;
  List<DrawerButtonEntity> children;
  Function press;

  DrawerButtonEntity(
      {this.title,
      this.icon,
      this.children = const <DrawerButtonEntity>[],
      this.press});
}
