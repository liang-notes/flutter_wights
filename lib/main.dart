import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets/animations/animatedPage.dart';
import 'package:flutter_widgets/buttons/buttonsPage.dart';
import 'package:flutter_widgets/buttons/checkBoxPage.dart';
import 'package:flutter_widgets/chips/chipPage.dart';
import 'package:flutter_widgets/dialog/dialogPage.dart';
import 'package:flutter_widgets/heros/heroPage.dart';
import 'package:flutter_widgets/widgets/container_page.dart';
import 'package:flutter_widgets/widgets/image_page.dart';
import 'package:flutter_widgets/widgets/list_page.dart';
import 'package:flutter_widgets/widgets/login_page.dart';
import 'package:flutter_widgets/widgets/demo_page.dart';
import 'package:flutter_widgets/widgets/text_page.dart';

void main() {
  debugPrint = (String message,{int wrapWidth}){};
  debugPrint = (String message,{int wrapWidth}) => debugPrintSynchronously(message, wrapWidth: wrapWidth);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'Container': (BuildContext context) => ContainerPage(),
        'Text': (BuildContext context) => TextPage(),
        'Image': (BuildContext context) => ImagePage(),
        'List': (BuildContext context) => ListPage(),
        'Form': (BuildContext context) => LoginPage(),
        'Animates': (BuildContext context) => AnimatedPage(),
        'Hero': (BuildContext context) => HeroPage(),
        'Demo': (BuildContext context) => DemoPage(),
        'Dialog': (BuildContext context) => DialogPage(),
        'Chip': (BuildContext context) => ChipPage(),
        'Buttons': (BuildContext context) => ButtonsPage(),
        'CheckBox': (BuildContext context) => CheckBoxPage(),

      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List items = [
    'Container',
    'Text',
    'Image',
    'List',
    'Form',
    'Animates',
    'Hero',
    'Demo',
    'Dialog',
    'Chip',
    'Buttons',
    'CheckBox'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 示例'),
        brightness: Brightness.light,
      ),
      body: Builder(builder: (BuildContext context) {
        return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListViewItem(
                title: items[index],
                onTap: () {
                  Navigator.of(context).pushNamed(items[index]);
                },
              );
            });
      }),
    );
  }
}

class ListViewItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ListViewItem({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(title),
            contentPadding: EdgeInsets.only(left: 20, right: 20),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: onTap,
          ),
          Divider(
            height: 1,
          )
        ],
      ),
    );
  }
}
