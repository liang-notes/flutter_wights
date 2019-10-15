import 'package:flutter/material.dart';

class AnimatedTweenOpacityPage extends StatefulWidget {
  @override
  _AnimatedTweenOpacityPageState createState() =>
      _AnimatedTweenOpacityPageState();
}

class _AnimatedTweenOpacityPageState extends State<AnimatedTweenOpacityPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> opacity;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    opacity.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Opacity(
        opacity: opacity.value,
        child: FlutterLogo(),
      ),
    );
  }
}
