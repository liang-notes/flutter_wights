import 'package:flutter/material.dart';

class ChipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('😊标签😊'),
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            spacing: 18.0,
            runSpacing: 0.0,
            alignment: WrapAlignment.start,
            children: <Widget>[
              Chip(
                avatar: Icon(Icons.add_alert),
                label: Text('styled Chip'),
                deleteIcon: Icon(Icons.close),
                labelStyle: TextStyle(color: Colors.white),
                backgroundColor: Colors.blue,
                elevation: 2,
                shadowColor: Colors.red,
                onDeleted: () {
                  print('delete.....');
                },
              ),
              Chip(
                label: Text('normal Chip'),
              ),
              ChoiceChip(
                label: Text('ChoiceChip'),
                selected: false,
                onSelected: (selected) {},
              ),
              ActionChip(
                label: Text('ActionChip'),
                onPressed: () {},
              ),
              FilterChip(label: Text('FilterChip'), onSelected: (selected) {}),
            ],
          ),


          ChipTheme(
              data: ChipThemeData(
                  backgroundColor: Colors.red,
                  disabledColor: Colors.yellow,
                  selectedColor: Colors.blue,
                  secondarySelectedColor: Colors.black,
                  labelPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  padding: EdgeInsets.all(3),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(style: BorderStyle.none)),
                  labelStyle: TextStyle(color: Colors.white),
                  secondaryLabelStyle: TextStyle(color: Colors.white),
                  brightness: Brightness.dark,
                  elevation: 20,
                  shadowColor: Colors.lightBlue),
              child: Wrap(
                spacing: 8,
                runSpacing: 10,
                alignment: WrapAlignment.spaceBetween,
                children: <Widget>[
                  Chip(label: Text('Text')),
                  Chip(label: Text('TextField')),
                  Chip(label: Text('Form')),
                  Chip(label: Text('Image')),
                ],
              ))
        ],
      ),
    );
  }
}
