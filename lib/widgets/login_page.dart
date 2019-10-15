import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //全局key用来获取form表单组件
  GlobalKey<FormState> _loginKey = GlobalKey();
  String _username;
  String _password;

  void _login() {
    var loginForm = _loginKey.currentState;
    if (loginForm.validate()) {
      loginForm.save();
      print('username=' + _username + 'password=' + _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
                key: _loginKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: '请输入用户名',
                      ),
                      onSaved: (value) {
                        _username = value;
                      },
                      onFieldSubmitted: (value) {},
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: '请输入密码',
                      ),
                      obscureText: true,
                      validator: (value) {
                        return value.length < 6 ? 'password too short' : null;
                      },
                      onSaved: (value) {
                        _password = value;
                      },
                      onFieldSubmitted: (value) {
                        print('$value');
                      },
                    ),

                    SizedBox(
                      width: 300,
                      child: RaisedButton(
                          child: Text('登录'),
                          onPressed: () {
                            _login();
                          }),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
