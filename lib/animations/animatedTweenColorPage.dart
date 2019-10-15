import 'package:flutter/material.dart';

class AnimatedTweenColorPage extends StatefulWidget {
  @override
  _AnimatedTweenColorPageState createState() => _AnimatedTweenColorPageState();
}

class _AnimatedTweenColorPageState extends State<AnimatedTweenColorPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Color> color;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2),vsync: this);
    color = ColorTween(begin: Colors.red,end: Colors.green).animate(controller);
    color.addListener((){
      setState(() {

      });
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
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              color: color.value,
              border: Border.fromBorderSide(BorderSide(color: Colors.black,width: 4))
          ),
          child: FlutterLogo(),
        ),
      ),
    );
  }

}
