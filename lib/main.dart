import 'package:flutter/material.dart';
import 'apropos.dart';
import 'note/note.dart';
import 'users/listusers.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Note(),
    Users(),
    aProposPage()
  ];


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.assignment),
              title: new Text('Notes'),
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.person_pin),
              title: new Text('Utilisateurs'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              title: Text('A propos')
          )
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

Future<bool> saveTitlePreferences(String title) async {
  final SharedPreferences prefs = await SharedPreferences
      .getInstance();
  return prefs.setString("titre", title);
}

Future<String> getTitlePreferences() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("titre");
}

Future<bool> saveContentPreferences(String content) async {
  final SharedPreferences prefs = await SharedPreferences
      .getInstance();
  return prefs.setString("contenu", content);
}

Future<String> getContentPreferences() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("contenu");
}
