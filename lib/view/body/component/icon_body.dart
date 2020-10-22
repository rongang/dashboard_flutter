import 'package:dashboard_flutter/resource/res.dart';
import 'package:dashboard_flutter/view/layout/right_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IconsBody extends StatefulWidget {
  final int index;
  static final cupertinoIconsKey = GlobalKey<_IconsBodyState>();

  IconsBody({Key key, this.index = 1}) : super(key: cupertinoIconsKey);

  @override
  _IconsBodyState createState() => _IconsBodyState();
}

class _IconsBodyState extends State<IconsBody>
    with AutomaticKeepAliveClientMixin {
  // AnimationController animationController;
  int index;
  final pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    index = widget.index;
    // animationController
  }

  changePage(int value) {
    if (index == value) return;
    // pageController.animateToPage(
    //   value,
    //   duration: Duration(milliseconds: 300),
    //   curve: Curves.linear,
    // );
    pageController.jumpToPage(value);
    // index = value;
    setState(() {
      index = value;
    });
  }

  bool a = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        RaisedButton(
          child: Text('change'),
          onPressed: () {
            // changePage();
            a = !a;
            setState(() {});
          },
        ),
        Flexible(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: index==0?1.0:0.0,
                child: CupertinoIconBody(),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: index==1?1.0:0.0,
                child: MaterialIconBody(),
              ),
              // FadeAnimation(child: Container(
              //   key: UniqueKey(),
              //   width: 100,
              //   height: 100,
              //   color: Colors.red,
              // )),
              // FadeAnimation(child: Container(
              //   key: UniqueKey(),
              //   width: 100,
              //   height: 100,
              //   color: Colors.purpleAccent,
              // )),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => false;
}

class MaterialIconBody extends StatefulWidget {
  const MaterialIconBody({
    Key key,
  }) : super(key: key);

  @override
  _MaterialIconBodyState createState() => _MaterialIconBodyState();
}

class _MaterialIconBodyState extends State<MaterialIconBody>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RightBodyLayout(
      children: [
        SliverGrid(
          gridDelegate:
              SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 120),
          delegate: SliverChildBuilderDelegate((context, index) {
            return Icon(
              IconData(0xe52a + index, fontFamily: 'MaterialIcons'),
            );
          }, childCount: 61485 - 58667),
        ),
        // SliverPersistentHeader()
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class CupertinoIconBody extends StatefulWidget {
  @override
  _CupertinoIconBodyState createState() => _CupertinoIconBodyState();
}

class _CupertinoIconBodyState extends State<CupertinoIconBody>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RightBodyLayout(
      children: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Icon(
                IconData(
                  62418 + index,
                  fontFamily: 'CupertinoIcons',
                  fontPackage: 'cupertino_icons',
                  matchTextDirection: true,
                ),
              );
            },
            childCount: 999,
          ),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
