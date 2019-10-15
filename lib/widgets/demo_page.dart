import 'package:flutter/material.dart';

const double OPACITY_LIMIT_OFFSET = 100.0;

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  double opacity = 0.0;

  _didScroll(double offset) {
    double op = offset / OPACITY_LIMIT_OFFSET;
    if (op < 0.0) {
      op = 0.0;
    } else if (op > 1) {
      op = 1;
    }
    setState(() {
      opacity = op;
    });
    print(offset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            NotificationListener(
              onNotification: (ScrollUpdateNotification notification) {
                if (notification is ScrollUpdateNotification && notification.depth == 0) {
                  _didScroll(notification.metrics.pixels);
                }
                return true;
              },
              child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView(
                    children: <Widget>[
//                      _setOverflowBox(),
                      _setItemStackView(context),
                      _gridView
                    ],
                  )),
            ),
            Opacity(
              opacity: opacity,
              child: FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    child: _appBar(context),
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  _appBar(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            Navigator.pop(context);
          }),
          Expanded(child:Center(child: Text('aaaa'),),),
          IconButton(icon: Icon(Icons.search), onPressed: (){

          })
        ],
      ),
    );
  }

  _setOverflowBox() {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.red),
          height: 200,
          child: _pageView(),
        ),
        Positioned(
          bottom: 30,
          right: 20,
          left: 20,
          child: Container(
            height: 0,
            child: _overflowBox(context),
          ),
        ),
      ],
    );
  }

  _setItemStackView(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.white),
          height: 300,
          child: Column(
            children: <Widget>[
              Flexible(
                child: _pageView(),
                flex: 90,
              ),
              Flexible(
                flex: 28,
                child: Container(),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 20,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(3, 3), blurRadius: 10)
                ],
                borderRadius: BorderRadius.all(Radius.circular(8))),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _item(context),
                _item(context),
                _item(context),
                _item(context)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget get _gridView {
    return Container(
      color: Colors.green,
      margin: EdgeInsets.only(top: 30),
      height: 900,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 3,
        primary: false,
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(0),
            decoration: BoxDecoration(color: Colors.red),
            child: Center(child: Text('0000')),
          ),
          Container(
            margin: EdgeInsets.all(0),
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(child: Text('1111')),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(child: Text('2222')),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(child: Text('1111')),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(child: Text('2222')),
          ),
        ],
      ),
    );
  }

  _pageView() {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[_image(), _image(), _image()],
    );
  }

  _image() {
    return Container(
        margin: EdgeInsets.only(top: 0),
        child: Image.network(
          "https://pixabay.com/get/52e4d0414f51a414f6da8c7dda79367e143bdde256596c48702973d3974ac551be_640.jpg",
          fit: BoxFit.fill,
        ));
  }

  _overflowBox(BuildContext context) {
    return OverflowBox(
      alignment: Alignment.topCenter,
      maxHeight: 200,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, offset: Offset(3, 3), blurRadius: 10)
            ],
            borderRadius: BorderRadius.all(Radius.circular(8))),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _item(context),
            _item(context),
            _item(context),
            _item(context)
          ],
        ),
      ),
    );
  }

  Widget _item(BuildContext context) {
    return Container(
      height: 80,
      child: GestureDetector(
        onLongPress: () {
          print("long press");
        },
        onTap: () {
          print('bbb');
          final snackBar = new SnackBar(content: new Text('这是一个SnackBar!'));
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Column(
          children: <Widget>[
            Icon(
              Icons.airplay,
              size: 48,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                '隔空投诉',
                style: TextStyle(color: Colors.green),
              ),
            )
          ],
        ),
      ),
    );
  }
}
