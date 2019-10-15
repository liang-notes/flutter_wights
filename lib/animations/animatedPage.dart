import 'package:flutter/material.dart';
import 'package:flutter_widgets/animations/animatedAlignPage.dart';
import 'package:flutter_widgets/animations/animatedContainerPage.dart';
import 'package:flutter_widgets/animations/animatedOpacityPage.dart';
import 'package:flutter_widgets/animations/animatedTweenColorPage.dart';
import 'package:flutter_widgets/animations/animatedTweenMovementPage.dart';
import 'package:flutter_widgets/animations/animatedTweenOpacityPage.dart';
import 'package:flutter_widgets/animations/animatedTweenCombinePage.dart';
import 'package:flutter_widgets/animations/animatedTweenRotatePage.dart';
import 'package:flutter_widgets/animations/animatedTweenScalePage.dart';
import 'package:flutter_widgets/animations/animatedTweenSizePage.dart';

class AnimatedPage extends StatefulWidget {
  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated 动画'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                child: Text(
                  'Animated',
                  style: TextStyle(color: Colors.red, fontSize: 25),
                )),

            Wrap(
              spacing: 0,
              runSpacing: 0,
              alignment: WrapAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                    child: Text('变形'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnimatedContainerPage()));
                    }),
                RaisedButton(
                    child: Text('移动'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnimatedAlignPage()));
                    }),
                RaisedButton(
                    child: Text('透明度'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnimatedOpacityPage()));
                    }),
              ],
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                'Tween',
                style: TextStyle(color: Colors.red, fontSize: 25),
            )),

            Wrap(
              children: <Widget>[
                RaisedButton(
                    child: Text('组合动画示例'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnimatedTweenPage()));
                    }),
                RaisedButton(
                    child: Text('颜色渐变动画示例'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnimatedTweenColorPage()));
                    }),
                RaisedButton(
                    child: Text('旋转动画示例'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnimatedTweenRotatePage()));
                    }),
                RaisedButton(
                    child: Text('透明度动画示例'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnimatedTweenOpacityPage()));
                    }),
                RaisedButton(
                    child: Text('平移动画示例'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnimatedTweenMovementPage()));
                    }),
                RaisedButton(
                    child: Text('缩放动画示例'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnimatedTweenSizePage()));
                    }),
                RaisedButton(
                    child: Text('缩放和透明度组合动画示例'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnimatedTweenScalePage()));
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
