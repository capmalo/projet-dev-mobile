import 'package:flutter/material.dart';
import '../main.dart';
import 'creationnote.dart';

class NotePage extends StatelessWidget {
  Widget build(BuildContext context) {
    final appTitle = 'Note';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Note(),
      ),
    );
  }
}

class Note extends StatefulWidget {
  @override
  NoteState createState() {
    return NoteState();
  }
}

class NoteState extends State<Note> {

  String _titleNote = "Pas de note";
  String _contentNote = "";

  @override
  void initState() {
    getTitlePreferences().then(updateTitle);
    getContentPreferences().then(updateContent);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notes"),
        ),
        body: Container(
            padding: const EdgeInsets.all(30.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                ),
                Center(
                    child: Text(
                      'Titre',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    )
                ),
                Center(
                    child: Text(_titleNote)
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                ),
                Center(
                    child: Text(
                      'Contenu',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    )
                ),
                Center(
                    child: Text(_contentNote)
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40, top: 50),
                  child : FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => CreationNote(),
                          )),
                      child: Text(
                        "Créer / modifier note",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    )
                ),
              ]
            )
        )
    );
  }

  void updateTitle(String title) {
    setState(() {
      if(title != null)
        this._titleNote = title;
    });
  }

  void updateContent(String content) {
    setState(() {
      if(content != null)
        this._contentNote = content;
    });
  }
}