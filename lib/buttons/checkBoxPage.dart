import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  @override
  _CheckBoxPageState createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool checkA = false;
  bool checkB = false;
  bool isExpanded = false;
  List<int> list = [0,1, 2, 3];
  int _open = -1; //闭合控制  默认全部关闭

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBox'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.blue,
                    value: checkA,
                    onChanged: (value) {
                      setState(() {
                        checkA = value;
                      });
                    }),
                Text('同意协议并注册'),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            CheckboxListTile(
                value: checkB,
                secondary: const Icon(Icons.alarm),
                title: const Text('6:00闹钟'),
                subtitle: Text('12点之后再响'),
                onChanged: (value) {
                  setState(() {
                    checkB = value;
                  });
                }),
            ExpansionPanelList(
              animationDuration: kThemeAnimationDuration,
              expansionCallback: (index, isOpen){
                setState(() {
                  _open = _open == index ? -1 : index;
                });
              },
              children: list.map((value) {
                return ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: _open == value,
                    headerBuilder: (context, open) {
                      return ListTile(title: Text('分组$value'),);
                    },
                    body: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ListBody(
                        children: list.map((k) {
                          return Card(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('内容$value---$k'),
                            ),
                          );
                        }).toList(),
                      ),
                    ));
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            ExpansionPanelList(
              children: <ExpansionPanel>[
                ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: isExpanded,
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text('标题 '),
                      );
                    },
                    body: Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: ListBody(
                        children: <Widget>[
                          Card(
                            margin: EdgeInsets.fromLTRB(0, 1, 0, 10),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('我是内容'),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('我是内容'),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('我是内容'),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
              expansionCallback: (index, expanded) {
                setState(() {
                  print(expanded);
                  isExpanded = !expanded;
                });
              },
              animationDuration: kThemeAnimationDuration,
            )
          ],
        ),
      ),
    );
  }
}
