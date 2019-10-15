import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mAboutDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AboutDialog(
          applicationName: 'app wedgits',
          applicationVersion: 'v1.0.0',
          applicationIcon: Icon(Icons.settings_applications),
          children: <Widget>[
            Text('升级内容1'),
            Text('升级内容2'),
            Text('升级内容3'),
          ],
        );
      });
}

mAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 20,
          backgroundColor: Colors.yellowAccent,
          semanticLabel: 'hahah',
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text('标题'),
          content: Text(
            '升级内容,升级内容,升级内容,升级内容,升级内容,升级内容',
          ),
          actions: <Widget>[
            FlatButton(
                child: Text('确定'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      });
}

mSimpleDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('选择性别'),
          children: <Widget>[
            SimpleDialogOption(
              child: const Text('男'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SimpleDialogOption(
              child: const Text('女'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SimpleDialogOption(
              child: const Text('人妖'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

mCupertinoAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('标题'),
          content: Text('hdjdkklalllll'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('取消'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text('确定'),
              onPressed: () {
                Navigator.pop(context,'hahas');
              },
            ),
          ],
        );
      }
  ).then((value){
      print(value);
  });
}

mCupertinoFullScreenDialog(BuildContext context, Animation<double> opacity) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoFullscreenDialogTransition(
            animation: opacity,
            child: Scaffold(
              body: Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text('全屏幕弹框'),
                ),
              ),
            ));
      });
}

mModalBottomSheet(BuildContext context) {
  showModalBottomSheet(context: context, builder: (BuildContext context){
    return Container(
      child: Center(child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),child: Text('hahah'),),
          Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),child: Text('hahah'),),
          Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),child: Text('hahah'),),
          Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),child: Text('hahah'),),
          Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),child: Text('hahah'),),
          Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),child: Text('hahah'),),
          Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),child: Text('hahah'),),
          Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),child: Text('hahah'),),
          Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),child: Text('hahah'),),
          Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),child: Text('hahah'),),
          Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),child: Text('hahah'),),
          RaisedButton(
            child: Text('确定'),
            onPressed: (){
              Navigator.pop(context,'哈哈哈');
            },
          ),
        ],
      ),),
    );
  }).then((value){
    print(value);
  });
}
