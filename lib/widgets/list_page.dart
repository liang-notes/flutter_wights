import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表组件'),
      ),
      body: ListView(
        children: <Widget>[_listTitle, _rowList, _gridView],
      ),
    );
  }

  ///网格组件
  Widget get _gridView {
    return Container(
      height: 600,
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        primary: false,
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.red
            ),
            child: Center(child: Text('0000')),
          ),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.blue
            ),
            child: Center(child: Text('1111')),
          ),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.blue
            ),
            child: Center(child: Text('2222')),
          ),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.blue
            ),
            child: Center(child: Text('1111')),
          ),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.blue
            ),
            child: Center(child: Text('2222')),
          ),
        ],
      ),
    );
  }

  ///水平列表组件
  Widget get _rowList {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 160,
            color: Colors.lightBlue,
            child: Image.asset("images/bmw_car.png"),
            margin: EdgeInsets.only(left: 10),
          ),
          Container(
            width: 160,
            color: Colors.amber,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                Text(
                  '水平',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '列表',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            color: Colors.deepOrange,
            margin: EdgeInsets.symmetric(horizontal: 10),
          ),
          Container(
            width: 200,
            color: Colors.blueGrey,
            child: Image.asset("images/bmw_car.png", fit: BoxFit.contain),
          )
        ],
      ),
    );
  }

  ///基础列表组件
  Widget get _listTitle {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.alarm),
          title: Text('闹钟aaaaaa'),
          subtitle: Text('10:10'),
          contentPadding: EdgeInsets.only(left: 30, right: 20),
          trailing: Icon(Icons.arrow_right),
        ),
        ListTile(
          leading: Icon(Icons.airplay),
          title: Text('隔空投送'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('电话'),
        ),
      ],
    );
  }
}
