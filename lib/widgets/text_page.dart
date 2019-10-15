import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text 组件'),
      ),
      body: _myText,
    );
  }

  /// 文本组件
  Widget get _myText {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            '哈哈哈',
            style: TextStyle(
                color: Color(0xffff0000),
                decoration: TextDecoration.lineThrough,
                decorationColor: const Color(0xff000000),
                fontSize: 25),
          ),
        ),
        Center(
          child: Text(
            '哈哈哈',
            style: TextStyle(
                color: Color(0xffff0000),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 6.0,
                decoration: TextDecoration.overline,
                decorationColor: const Color(0xff000000),
                fontSize: 25),
          ),
        ),
        Center(
          child: Text(
            '哈',
            style: TextStyle(
                color: Color(0xffff0000),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 6.0,
                decoration: TextDecoration.lineThrough,
                decorationColor: const Color(0xff000000),
                decorationStyle: TextDecorationStyle.wavy,
                fontSize: 25),
          ),
        )
      ],
    );
  }
}
