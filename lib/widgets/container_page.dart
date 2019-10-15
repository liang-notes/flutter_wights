import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('容器组件'),
        actions: <Widget>[
          FlatButton(
              child: Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('Hero');
              }),
        ],
      ),
      body: _myContainer,
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
    );
  }

  /// 容器组件
  Widget get _myContainer {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 100, right: 10),
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey[200],
            width: 3.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: AnimatedAlign(
          alignment: Alignment(10, 20),
          duration: Duration(seconds: 0),
          child: Container(
            height: 50,
            width: 50,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class TransformAnimation extends StatefulWidget {
  @override
  _TransformAnimationState createState() => _TransformAnimationState();
}

class _TransformAnimationState extends State<TransformAnimation> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
