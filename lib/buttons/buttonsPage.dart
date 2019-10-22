import 'package:flutter/material.dart';
import 'package:flutter_widgets/custom/expandable_view.dart';

class ButtonsPage extends StatefulWidget {
  @override
  _ButtonsPageState createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage> {
  var value;

  bool _isExpand;

  @override
  void initState() {
    _isExpand = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String longString = '超过最大行数三行的多行文本超过最大行数三行的多行文本超过最大行数三行的多行文本'
        '超过最大行数三行的多行文本超过最大行数三行的多行文本超过最大行数三行的多行文本超过最大行数三行的多行文本';
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPane'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: FlatButton(
                child: _isExpand ? Text('收起') : Text('展开'),
                onPressed: () {
                  setState(() {
                    _isExpand = !_isExpand;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 200,right: 10),
              child: ExpandableView(
                expand: _isExpand,
                onExpandChanged: (value) {
                  print('aaaaa====$value');
                },
                children: <Widget>[
                  Container(
                    color: Colors.yellow,
                    child: Text(longString),
                  ),
                  Container(
                    color: Colors.yellow,
                    child: Image.network('http://pic4.nipic.com/20090823/3193830_122340002_2.jpg'),
                  ),
                ],
              ),
            ),
            Container(
                child: Text(
                  value ?? '',
                  style: TextStyle(color: Colors.red, fontSize: 30),
                )),
            Container(
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                runAlignment: WrapAlignment.spaceEvenly,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                      child: Text('普通按钮'),
                      textColor: Colors.white,
                      color: Colors.blue[200],
                      elevation: 10,
                      splashColor: Colors.red,
                      onPressed: () {}),
                  RaisedButton(
                    child: Text('圆角按钮'),
                    onPressed: () {},
                    color: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  RaisedButton(
                    child: Text('圆'),
                    onPressed: () {
                      showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(100, 210, 30, 0),
                          items: [
                            PopupMenuItem(
                              value: 'sss',
                              child: Text('item1'),
                            ),
                            PopupMenuItem(
                              value: 'ssj',
                              child: Text('item2'),
                            )
                          ]);
                    },
                    color: Colors.pink,
                    shape: CircleBorder(
                        side: BorderSide(width: 2, color: Colors.white)),
                  ),
                  FlatButton(
                    child: Text('扁平按钮'),
                    color: Colors.blue,
                    splashColor: Colors.deepOrange,
                    onPressed: () {},
                  ),
                  OutlineButton(
                      borderSide: BorderSide(color: Colors.blue, width: 3),
                      child: Text('边框按钮'),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.access_alarms),
                      splashColor: Colors.deepOrange,
                      highlightColor: Colors.limeAccent,
                      tooltip: '图标按钮',
                      onPressed: () {}),
                  FloatingActionButton(
                      child: Text('悬浮'),
                      onPressed: () {
                        showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(100, 280, 30, 0),
                            items: [
                              PopupMenuItem(
                                value: 'sss',
                                child: Text('item1'),
                              ),
                              PopupMenuItem(
                                value: 'ssj',
                                child: Text('item2'),
                              )
                            ]);
                      }),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      RaisedButton(
                          child: Text('ButtonBar-button1'), onPressed: () {}),
                      RaisedButton(
                          child: Text('ButtonBar-button2'), onPressed: () {}),
                    ],
                  ),
                  _dropdownButton,
                  _popMenuButton,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// DropdownButton
  Widget get _dropdownButton {
    return Container(
      child: DropdownButton(
          hint: Text('请选择...'),
          value: value,
          items: [
            DropdownMenuItem(
              child: Text(
                '周一',
                style: TextStyle(color: Colors.red),
              ),
              value: '米饭',
            ),
            DropdownMenuItem(
              child: Text('周二'),
              value: '面食',
            ),
            DropdownMenuItem(
              child: Text('周三'),
              value: '肥牛',
            ),
            DropdownMenuItem(
              child: Text('周四'),
              value: '小僵尸',
            ),
            DropdownMenuItem(
              child: Text('周五'),
              value: '点读的',
            ),
            DropdownMenuItem(
              child: Text('周六'),
              value: '休闲',
            ),
            DropdownMenuItem(
              child: Text('周日'),
              value: '娱乐',
            ),
          ],
          onChanged: (v) {
            setState(() {
              value = v;
            });
          }),
    );
  }

  /// PopupMenuButton
  Widget get _popMenuButton {
    return PopupMenuButton(onSelected: (s) {
      print(s);
    }, onCanceled: () {
      print('cancel');
    }, itemBuilder: (BuildContext context) {
      List<PopupMenuEntry> list = List<PopupMenuEntry>();
      list.add(PopupMenuItem(
        child: Text('item1'),
        value: '111',
      ));
      list.add(PopupMenuItem(
        child: Text('item2'),
        value: '222',
      ));
      list.add(PopupMenuDivider());
      list.add(CheckedPopupMenuItem(
        child: Text('item3'),
        value: '333',
        checked: true,
      ));
      return list;
    });
  }
}
