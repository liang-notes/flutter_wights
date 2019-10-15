import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedTweenRotatePage extends StatefulWidget {
  @override
  _AnimatedTweenRotatePageState createState() => _AnimatedTweenRotatePageState();
}

class _AnimatedTweenRotatePageState extends State<AnimatedTweenRotatePage> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> rotate;

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    rotate = Tween(begin: 0.0,end: pi*2).animate(animationController);
    rotate.addListener((){
      setState(() {

      });
    });
    rotate.addStatusListener((status){
      print(status);
      if (status == AnimationStatus.completed) {
        animationController.reset();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 30,
          width: 30,
          transform: Matrix4.identity()..rotateZ(rotate.value),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

