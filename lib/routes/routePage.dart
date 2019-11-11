import 'package:flutter/material.dart';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Root'),),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('next'),
            onPressed: (){
              Navigator.pushNamed(context, 'Page1');
            },
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page1'),),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('下一页'),
            onPressed: (){
              Navigator.pushNamed(context, 'Page2');
            },
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page2'),),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('下一页'),
            onPressed: (){
              Navigator.pushNamed(context, 'Page3');
//              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ThreePage()));
//
//              Navigator.popAndPushNamed(context, '/page3');
//              Navigator.of(context).popAndPushNamed('/page3');
              
            },
          ),
        ),
      ),
    );
  }
}

class ThreePage extends StatefulWidget {
  @override
  _ThreePageState createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page3'),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('返回上一个页面'),
                onPressed: (){
                  pop();
                },
              ),

              RaisedButton(
                child: Text('返回根页面'),
                onPressed: (){
                  popToRoot();
                },
              ),

              RaisedButton(
                child: Text('返回A页面'),
                onPressed: (){
                  popToSpecifiedPage();
                },
              ),

            ],
          ),
        )
      ),
    );
  }

  ///返回上一页
  void pop() {
    Navigator.pop(context);
  }

  ///返回Root页
  void popToRoot() {
    Navigator.popAndPushNamed(context, '/');
  }

  ///返回指定页面
  void popToSpecifiedPage() {
//    Navigator.pushNamedAndRemoveUntil(context, 'Page4', ModalRoute.withName('Page2'));


    Navigator.popUntil(context, ModalRoute.withName('Page1'));

//    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FourPage()), ModalRoute.withName('/'));
//    Navigator.pushNamedAndRemoveUntil(context, 'Page4', ModalRoute.withName('/'));

//    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
//      return SecondPage();
//    }), ModalRoute.withName('Page1'));

//    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
//      return FourPage();
//    }), (Route<dynamic> route) => false);

//    Navigator.pushNamedAndRemoveUntil(context, newRouteName, predicate)
  }

}

class FourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page4'),),
      body: Center(child: Text('测试pushAndRemoveUntil'),),
    );
  }
}






