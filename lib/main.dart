import 'package:flutter/cupertino.dart';
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
import 'package:flutter_widgets/widgets/login_page.dart';
import 'package:flutter_widgets/widgets/demo_page.dart';
import 'package:flutter_widgets/widgets/text_page.dart';

void main() {
//  debugPrint = (String message, {int wrapWidth}) {};
//  debugPrint = (String message, {int wrapWidth}) =>
//      debugPrintSynchronously(message, wrapWidth: wrapWidth);
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
    if (state == AppLifecycleState.resumed) {
      loadClipboardContents();
    }
  }

  loadClipboardContents() async {
    ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
    print(data.text);
    if (data != null && data.text.trim() != '') {
      String _content = data.text.trim();
      if (RegExp(r'[\uffe5]+.+[\uffe5]').hasMatch(_content)) {
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Text('淘口令'),
                content: Text(_content),
              );
            });
        Clipboard.setData(ClipboardData(text: ''));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListPage(),
    );
  }
}


class ListPage extends StatelessWidget {
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
