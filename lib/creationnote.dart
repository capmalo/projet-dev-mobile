import 'package:flutter/material.dart';
import 'main.dart';
import 'note.dart';

class CreationNote extends StatelessWidget {
  Widget build(BuildContext context) {
    final appTitle = 'Ajout / modification d\'une note';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: NoteForm(),
      ),
    );
  }
}

// Create a Form widget.
class NoteForm extends StatefulWidget {
  @override
  NoteFormState createState() {
    return NoteFormState();
  }
}

class NoteFormState extends State<NoteForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  var _controllerTitle = new TextEditingController();
  String _titleNote = "";

  @override
  void initState() {
    getTitrePreferences().then(updateTitle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _controllerTitle,
              decoration: new InputDecoration(
                  hintText: _titleNote,
                  labelText: 'Titre'
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Veuillez entrer un titre';
                }
                return null;
              }
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Veuillez entrer un message';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  saveTitle();
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePage(),
                      ));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  void updateTitle(String title) {
    setState(() {
      if(title != null)
        this._titleNote = title;
    });
  }

  void saveTitle(){
    String title = _controllerTitle.text;
    saveTitlePreferences(title);
  }
}

