import 'package:flutter/material.dart';

class RightBodyLayout extends StatelessWidget {
  final List<Widget> children;

  const RightBodyLayout({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: NestedScrollView(
          headerSliverBuilder: (context, id) {
            return <Widget>[SliverToBoxAdapter()];
          },
          body: Builder(builder: (context) {
            return CustomScrollView(
              slivers: children,
            );
          }),
        ),
      ),
    );
  }
}

class FadeAnimation extends StatelessWidget {
  final Widget child;

  const FadeAnimation({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 500),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        print('$value');
        return AnimatedOpacity(
          duration: Duration(),
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }
}
