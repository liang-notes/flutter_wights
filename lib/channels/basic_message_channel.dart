import 'package:flutter/services.dart';


class ChannelTools {
  static const BasicMessageChannel _basicMessageChannel = BasicMessageChannel(
      'liang.BasicMessageChannel',StringCodec()
  );

  void _recevieData() {
    _basicMessageChannel.setMessageHandler(_handleMessage);
  }

  Future<dynamic> _handleMessage(String message) async {
    return '收到native消息$message';
  }

  Future<void> _sendMessage() async {
    try{
      String response = await _basicMessageChannel.send('发送给native消息');
      print('send success $response');
    } catch (e) {
      print(e);
    }
  }


}

