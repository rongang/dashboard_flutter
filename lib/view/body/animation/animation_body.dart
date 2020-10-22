import 'package:dashboard_flutter/view/layout/right_layout.dart';
import 'package:flutter/material.dart';

class AnimationBody extends StatefulWidget {
  @override
  _AnimationBodyState createState() => _AnimationBodyState();
}

class _AnimationBodyState extends State<AnimationBody> {
  bool isFirst = false;

  @override
  Widget build(BuildContext context) {
    return RightBodyLayout(
      children: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              TextButton(
                child: Text('change'),
                onPressed: () {
                  setState(() {
                    isFirst = !isFirst;
                  });
                },
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 400),
                // tween: Tween(begin: 0.0, end: 1.0),
                // builder: (context, value, child) {
                  child: isFirst
                      ? Container(
                          key: UniqueKey(),
                          width: 100,
                          height: 100,
                          color: Colors.red,
                        )
                      : Container(
                          key: UniqueKey(),
                          width: 100,
                          height: 100,
                          color: Colors.purpleAccent,
                        )

              )
            ],
          ),
        )
      ],
    );
  }
}
