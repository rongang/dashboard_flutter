import 'dart:async';

import 'package:dashboard_flutter/view/body/component/icon_body.dart';
import 'package:dashboard_flutter/view/navigator/button_naivgator.dart';
import 'package:dashboard_flutter/view/navigator/drawer_button.dart';
import 'package:dashboard_flutter/provider/app_profile_provider.dart';
import 'package:dashboard_flutter/resource/res.dart';
import 'package:dashboard_flutter/services/overlay/overlay_pop.dart';
import 'package:flutter/material.dart';
import 'package:screen_utils/screen_utils.dart';
import 'package:provider/provider.dart';

class BaseLayout extends StatefulWidget {
  BaseLayout({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BaseLayoutState createState() => _BaseLayoutState();
}

const expandedWidth = 200;
const unexpandedWidth = 50;

class _BaseLayoutState extends State<BaseLayout> {
  int dashBoardFlex = 5;
  bool expanded = true;

  toggleExpanded() {
    dashBoardFlex = expanded ? 5 : 20;
    expanded = !expanded;
    setState(() {});
  }

  var buttons = [
    DrawerButtonEntity(
        title: "表单页",
        icon: Icons.format_align_justify,
        children: [
          DrawerButtonEntity(title: '基础表单'),
          DrawerButtonEntity(title: '分步表单'),
          DrawerButtonEntity(title: '高级表单'),
        ]),
    DrawerButtonEntity(title: "列表页", icon: Icons.list_alt, children: [
      DrawerButtonEntity(title: '基础列表'),
    ]),
    DrawerButtonEntity(title: "详情页", icon: Icons.details_rounded, children: [
      DrawerButtonEntity(title: '工单详情'),
    ]),
    DrawerButtonEntity(
      title: "异常页",
      icon: Icons.details_rounded,
    ),
    DrawerButtonEntity(title: "图标页面", icon: Icons.whatshot, children: [
      DrawerButtonEntity(title: 'Cupertino图标'),
      DrawerButtonEntity(title: 'Material图标', press: () {}),
    ]),
  ];

  List<int> get selected => _selected;
  List<int> _selected = [0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: expanded
                  ? Adapt.set(expandedWidth)
                  : Adapt.set(unexpandedWidth),
              color: KColor.main,
              height: Adapt.screenHeight,
              child: Scrollbar(
                child: ListView(
                  children: [
                    DashBoardHeader(
                      expanded: expanded,
                    ),
                    DrawerButtonLayout(
                      press: (double index) {
                        setState(() {
                          _selected.setAll(0,
                              [index.floor() - 1, ((index * 10) % 10).toInt()]);
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                alignment: Alignment.centerLeft,
                height: 50,
                width: expanded
                    ? Adapt.set(expandedWidth)
                    : Adapt.set(unexpandedWidth),
                child: IconButton(
                  icon: Icon(Icons.wb_sunny),
                  onPressed: () {
                    context.read<AppProfileProvider>().changeThemeMode();
                    // Navigator.pushAndRemoveUntil(context, PageRouteBuilder(
                    //   // transitionDuration: Duration(seconds: 5),
                    //   pageBuilder: (context, animation1, animation2) {},
                    //   transitionsBuilder: (context, animation1, animation2,child){
                    //     return FadeTransition(
                    //       opacity: animation1,
                    //       child: EmptyPage(),
                    //     );
                    //   }
                    // ), (route) => false);
                  },
                ),
              ),
            ),
          ],
        ),
        Expanded(
          flex: dashBoardFlex,
          child: Container(
            height: Adapt.screenHeight - 70,
            child: Column(
              children: [
                BodyHeader(
                  press: toggleExpanded,
                ),
                // CupertinoIconsBody(),
                Flexible(
                  child: IndexedStack(
                    index: selected[0],
                    children: [
                      CupertinoIconsBody(
                        index: selected[1],
                      ),
                      Container(
                        // width: 100,
                        height: 100,
                        width: 200,
                        color: Colors.red,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class BodyHeader extends StatefulWidget {
  const BodyHeader({
    Key key,
    this.press,
  }) : super(key: key);
  final Function press;

  @override
  _BodyHeaderState createState() => _BodyHeaderState();
}

class _BodyHeaderState extends State<BodyHeader> {
  Timer timer1, timer2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        children: [
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.list),
            onPressed: widget.press,
          ),
          // GestureDetector(
          //
          // ),
          Spacer(),
          InkWell(
            onHover: (v) {
              // print('$v');
              timer1?.cancel();
              timer2?.cancel();
              if (v) {
                Timer(Duration(milliseconds: 250), () {
                  OverlayPop.show((context) => Positioned(
                        top: 60,
                        right: 0,
                        child: PersonSubInfo(),
                      ));
                });
              } else {
                timer1 = Timer(Duration(milliseconds: 250), () {
                  if (OverlayPop.isCanHide) {
                    PersonSubInfo.personSubInfoKey.currentState.hide();
                    timer2 = Timer(Duration(milliseconds: 250), () {
                      OverlayPop.hide();
                    });
                  }
                });
              }
            },
            onTap: () {},
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  clipBehavior: Clip.hardEdge,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: ClipOval(
                      child: Image.asset(
                          'assets/images/image1.jpg')),
                ),
                Text('rongang')
              ],
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      decoration: BoxDecoration(
          color: KColor.backGround,
          border: Border(bottom: BorderSide(width: 0.2))),
    );
  }
}

class DashBoardHeader extends StatelessWidget {
  final bool expanded;

  const DashBoardHeader({Key key, this.expanded = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.center,
      // padding: const EdgeInsets.all(20),
      child: expanded
          ? Text(
              'Flutter Web',
              maxLines: 1,
              overflow: TextOverflow.visible,
              style: KFont.defaultTextStyle.copyWith(
                fontSize: KDimens.headLine1,
                color: KColor.textGrey,
              ),
            )
          : Icon(Icons.home, color: KColor.textGrey),
      // color: KColor.main,
    );
  }
}

class PersonSubInfo extends StatefulWidget {
  static final personSubInfoKey = GlobalKey<_PersonSubInfoState>();

  @override
  _PersonSubInfoState createState() => _PersonSubInfoState();

  PersonSubInfo() : super(key: personSubInfoKey);
}

class _PersonSubInfoState extends State<PersonSubInfo>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  hide() {
    animationController?.reverse();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: InkWell(
          hoverColor: Colors.transparent,
          onHover: (v) {
            // print('$v');
            if (v)
              OverlayPop.isCanHide = false;
            else {
              OverlayPop.isCanHide = true;
              hide();
              Timer(Duration(milliseconds: 250), () {
                OverlayPop.hide();
              });
            }
          },
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: CustomPaint(
                  painter: TrianglePainter(KColor.main),
                  size: Size(14, 10),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: KColor.main,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Path p = Path();
    p.moveTo(size.width / 2, 0);
    p.lineTo(0, size.height);
    p.lineTo(size.width, size.height);
    // p.lineTo(size.width/2, 0);
    p.close();
    canvas.drawPath(p, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
