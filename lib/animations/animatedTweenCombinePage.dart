import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimatedTweenPage extends StatefulWidget {
  @override
  _AnimatedTweenPageState createState() => _AnimatedTweenPageState();
}

class _AnimatedTweenPageState extends State<AnimatedTweenPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> opacity;
  Animation<double> rotate;
  Animation<EdgeInsets> movement;
  Animation<double> width;
  Animation<double> height;
  Animation<BorderRadius> radius;
  Animation<Color> color;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 6), vsync: this);


    // 以下 写法  所有动画同时 进行
//    opacity = Tween<double>(begin: 0.0, end: 1.0,).animate(controller);
//    rotate = Tween<double>(begin: 0, end: Math.pi * 2,).animate(controller);
//    movement = Tween<EdgeInsets>(
//      begin: EdgeInsets.only(top: 0.0), end: EdgeInsets.only(top: 300.0),)
//        .animate(controller);
//    radius = Tween<BorderRadius>(
//      begin: BorderRadius.circular(0.0), end: BorderRadius.circular(150.0),)
//        .animate(controller);
//    color =
//        ColorTween(begin: Colors.blue, end: Colors.red,).animate(controller);
//    width = Tween(begin: 0.0, end: 300.0).animate(controller);
//    height = Tween(begin: 0.0, end: 300.0).animate(controller);

    // 为动画添加延迟 写法
    opacity = Tween<double>(
        begin: 0.0,
        end: 1.0
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.1, curve: Curves.easeIn))
    );

    rotate = Tween(
        begin: 0.0,
        end: Math.pi * 2
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.2, curve: Curves.ease))
    );

    movement = EdgeInsetsTween(
      begin: EdgeInsets.only(top: 0.0),
      end: EdgeInsets.only(top: 100.0),
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.2, 0.375, curve: Curves.fastOutSlowIn)));

    height = Tween<double>(
      begin: 100.0,
      end: 400.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.375,
          0.6,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    width = Tween<double>(
      begin: 100.0,
      end: 400.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.375,
          0.6,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    radius = BorderRadiusTween(
            begin: BorderRadius.circular(0.0),
            end: BorderRadius.circular(200.0))
        .animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 0.75, curve: Curves.ease)));

    color = ColorTween(begin: Colors.blue, end: Colors.orange).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 0.75, curve: Curves.linear)));

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget child) {
            return Center(
              child: Container(
                  padding: movement.value,
                  transform: Matrix4.identity()..rotateZ(rotate.value),
                  child: Opacity(
                    //透明度渐变
                      opacity: opacity.value,
                      child: Container(
                          width: width.value,
                          height: height.value,
                          decoration: BoxDecoration(
                            color: color.value,
                            border: new Border.all(
                              //黑色 3像素边框
                              color: Colors.black,
                              width: 3.0,
                            ),
                            borderRadius: radius.value,
                          ),
                          child: FlutterLogo()
                      )
                  )
              ),
            );
      }),
    );
  }

  Widget buildAnimated(BuildContext context, Widget child) {
    return Center(
      child: Container(
          padding: movement.value,
          transform: Matrix4.identity()..rotateZ(rotate.value),
          child: Opacity(
            //透明度渐变
              opacity: opacity.value,
              child: Container(
                  width: width.value,
                  height: height.value,
                  decoration: BoxDecoration(
                    color: color.value,
                    border: new Border.all(
                      //黑色 3像素边框
                      color: Colors.black,
                      width: 3.0,
                    ),
                    borderRadius: radius.value,
                  ),
                  child: FlutterLogo(
                    size: 300,
                  )
              )
          )
      ),
    );
  }
}
