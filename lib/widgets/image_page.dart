import 'package:flutter/material.dart';
import 'package:flutter_widgets/custom/countdown_button.dart';
import 'package:flutter_widgets/custom/curve_clipper.dart';
import 'package:flutter_widgets/custom/expandable_text.dart';
import 'package:flutter_widgets/custom/expandable_view.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String shortText = '不超过最大行数三行的多行文本不超过最大行数三行的多行文本';
    String longText = '超过最大行数三行的多行文本超过最大行数三行的多行文本超过最大行数三行的多行文本'
        '超过最大行数三行的多行文本超过最大行数三行的多行文本超过最大行数三行的多行文本超过最大行数三行的多行文本';

    return Scaffold(
      appBar: AppBar(
        title: Text('图片组件'),
      ),
      body: ListView(
        children: <Widget>[
          _myImage,
          _myIconsAndIconButton(context),
          Text('短文本测试：'),
          Container(
            padding: EdgeInsets.only(left: 30,right: 30),
            color: Colors.yellow,
            child: ExpandableText(
              text: shortText,
              maxLines: 2,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Text('长文本测试：'),
          Container(
            padding: EdgeInsets.only(left: 30,right: 30),
            color: Colors.yellow,
            child: ExpandableText(
              text: longText,
              maxLines: 2,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),

          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              color: Colors.red,
              height: 200,
            ),
          ),

          CountdownButton(
            countdown: 5,
            onTapCallBack: (){
              print('CountdownButton');
            },
            enable: true,
          ),
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
