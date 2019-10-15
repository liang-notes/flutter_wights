import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  bool _visible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedOpacity渐变'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              '''
  AnimatedOpacity组件介绍：
  
  可以自动的在给定一段时间内改变child的透明度
  点击按钮，矩形区域会渐渐变成透明，
  再次点击，会从不透明变成透明
''',
              style: TextStyle(fontSize: 18),
            ),
          ),
          AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 2000),
            child: Container(
              width: 300,
              height: 300,
              color: Colors.deepOrange,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.flip),
          tooltip: '显示隐藏',
          onPressed: () {
            setState(() {
              _visible = !_visible;
            });
          }),
    );
  }
}
