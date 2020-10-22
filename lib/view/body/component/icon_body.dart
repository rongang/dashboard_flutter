
import 'package:dashboard_flutter/resource/res.dart';
import 'package:dashboard_flutter/view/layout/right_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoIconsBody extends StatefulWidget {
  final int index;

  const CupertinoIconsBody({Key key, this.index}) : super(key: key);

  @override
  _CupertinoIconsBodyState createState() => _CupertinoIconsBodyState();
}

class _CupertinoIconsBodyState extends State<CupertinoIconsBody>
    with AutomaticKeepAliveClientMixin {
  // AnimationController animationController;
  @override
  void initState() {
    super.initState();
    // animationController
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 1000),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return AnimatedOpacity(
          duration: Duration(),
          opacity: value,
          child: widget.index == 1
              ? RightBodyLayout(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 300,
                      color: KColor.backGround,
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 300,
                      color: KColor.backGround,
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 300,
                      color: KColor.backGround,
                    ),
                  ),
                ],
              ),
              Divider(),
            ],
          )
              : RightBodyLayout(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 300,
                      color: KColor.main,
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 300,
                      color: KColor.main,
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 300,
                      color: KColor.main,
                    ),
                  ),
                ],
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => false;
}