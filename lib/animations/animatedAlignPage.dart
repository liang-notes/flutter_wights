import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  @override
  _AnimatedAlignPageState createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  double _x = -1;
  double _y = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedAlign示例'),
      ),
      body: AnimatedAlign(
        alignment: Alignment(_x, _y),
        duration: Duration(seconds: 1),
        child: Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              final random = Random();

              _x = ((random.nextInt(200) - 100) / 100).toDouble();
              _y = ((random.nextInt(200) - 100) / 100).toDouble();

            });
          }),
    );
  }
}
