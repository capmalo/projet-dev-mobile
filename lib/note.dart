import 'dart:async';

import 'package:flutter/material.dart';
import 'main.dart';
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

  @override
  void initState() {
    getTitrePreferences().then(updateTitle);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 50),
                    child: Text(_titleNote)
                ),

               Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
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
      else
        this._titleNote = "Pas de note";
    });
  }
}