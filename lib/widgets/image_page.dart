import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('图片组件'),),
      body: ListView(
        children: <Widget>[
          _myImage,
          _myIconsAndIconButton(context)
        ],
      ),
    );
  }

  /// 图片组件
  Widget get _myImage {
    return Column(
      children: <Widget>[
        //本地资源图片
        Center(
          child: Image.asset(
            "images/bmw_car.png",
            width: 200,
            fit: BoxFit.fill,
          ),
        ),

        //网络图片
        Center(
          child: Image.network(
            "http://pic4.nipic.com/20090823/3193830_122340002_2.jpg",
            width: 200,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }

  /// 图标及按钮组件
  Widget _myIconsAndIconButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          Icons.phone,
          color: Colors.green[800],
          size: 50.0,
        ),
        IconButton(
          icon: Icon(
            Icons.volume_up,
            size: 50.0,
          ),
          tooltip: '按下操作',
          onPressed: () {
            print("按下操作");
          },
        )
      ],
    );
  }
}