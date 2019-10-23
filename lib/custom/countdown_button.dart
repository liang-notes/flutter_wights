import 'package:flutter/material.dart';
import 'dart:async';

class CountdownButton extends StatefulWidget {
  final int countdown;
  final Function onTapCallBack;
  final bool enable;

  CountdownButton(
      {Key key, this.countdown = 60, this.onTapCallBack, this.enable = false})
      : super(key: key);

  @override
  _CountdownButtonState createState() => _CountdownButtonState();
}

class _CountdownButtonState extends State<CountdownButton> {
  static final TextStyle _enableStyle = TextStyle(
    fontSize: 16.0,
    color: const Color(0xFF00CACE),
  );

  static final TextStyle _disableStyle = TextStyle(
    fontSize: 16.0,
    color: const Color(0xFFCCCCCC),
  );

  Timer _timer;
  int _currentSeconds;
  TextStyle inkWellStyle = _enableStyle;
  String _verifyStr = '获取验证码';

  bool get enable => widget.enable;

  int get countdown => widget.countdown;

  Function get onTapCallBack => widget.onTapCallBack;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _currentSeconds = widget.countdown;
  }

  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_currentSeconds == 0) {
        _cancelTimer();
        _currentSeconds = countdown;
        inkWellStyle = _enableStyle;
        setState(() {});
        return;
      }

      _currentSeconds--;
      _verifyStr = '已发送$_currentSeconds' + 's';
      setState(() {});
      if (_currentSeconds == 0) {
        _verifyStr = '重新发送';
      }
    });
  }

  _cancelTimer() {
    _timer?.cancel();
  }

  Function _onTap() => () {
    _startTimer();
    inkWellStyle = _disableStyle;
    _verifyStr = '已发送$_currentSeconds' + 's';
    setState(() {});
    onTapCallBack();
  };

  @override
  Widget build(BuildContext context) {
    return enable
        ? InkWell(
            child: Text(
              ' $_verifyStr ',
              style: inkWellStyle,
            ),
            onTap: (_currentSeconds == countdown) ? _onTap() : null,
          )
        : InkWell(
            child: Text(
              ' 获取验证码 ',
              style: _disableStyle,
            ),
          );
  }
}
