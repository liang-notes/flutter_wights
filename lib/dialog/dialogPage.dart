import 'package:flutter/material.dart';
import 'package:flutter_widgets/dialog/mDialog.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> opacity;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.easeIn);
    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(curve);
    opacity.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

            RaisedButton(
                child: Text('AboutDialog'),
                onPressed: () {
                  mAboutDialog(context);
                }),
            RaisedButton(
                child: Text('AlertDialog'),
                onPressed: () {
                  mAlertDialog(context);
                }),
            RaisedButton(
                child: Text('SimpleDialog'),
                onPressed: () {
                  mSimpleDialog(context);
                }),
            RaisedButton(
                child: Text('CupertinoAlertDialog'),
                onPressed: () {
                  mCupertinoAlertDialog(context);
                }),
            RaisedButton(
                child: Text('CupertinoFullScreenDialog'),
                onPressed: () {
                  mCupertinoFullScreenDialog(context, opacity);
                  if (controller.isAnimating || controller.isCompleted) {
                    controller.forward(from: 0.0);
                  }
                  if (controller.isDismissed) {
                    controller.forward();
                  }
                }),
            RaisedButton(
                child: Text('ModalBottomSheet'),
                onPressed: () {
                  mModalBottomSheet(context);
                }),

          ],
        ),
      ),
    );
  }
}
