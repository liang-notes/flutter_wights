import 'package:flutter/material.dart';

class AnimatedTweenSizePage extends StatefulWidget {
  @override
  _AnimatedTweenSizePageState createState() => _AnimatedTweenSizePageState();
}

class _AnimatedTweenSizePageState extends State<AnimatedTweenSizePage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: Duration(seconds: 2));
    final CurvedAnimation curved = CurvedAnimation(parent: controller, curve: Curves.linear);
    animation = Tween<double>(begin: 100.0,end: 300.0).animate(curved);
    animation.addListener((){
      setState(() {

      });
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        color: Colors.green,
        child: FlutterLogo(),
      ),
    );
  }
}

