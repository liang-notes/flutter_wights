import 'package:flutter/material.dart';

class AnimatedTweenMovementPage extends StatefulWidget {
  @override
  _AnimatedTweenMovementPageState createState() => _AnimatedTweenMovementPageState();
}

class _AnimatedTweenMovementPageState extends State<AnimatedTweenMovementPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<EdgeInsets> movement;

  @override
  void initState() {

    controller = AnimationController(vsync: this,duration: Duration(seconds: 2));
    final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    movement = Tween<EdgeInsets>(begin: EdgeInsets.only(top: 0),end: EdgeInsets.only(top: 300)).animate(curve);
    movement.addListener((){
      setState(() {

      });
    });
    movement.addStatusListener((state) {
      print("$state");
    });
    controller.forward();
    super.initState();
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: movement.value,
          child: Container(
            color: Colors.orange,
            margin: EdgeInsets.all(10),
            child: FlutterLogo(size: 100,),
          ),
        ),
      ),
    );
  }
}
