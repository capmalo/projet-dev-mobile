import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class aProposPage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RaisedButton(
              child: Text('Go to Second Screen'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyHomePage(),
                  )))),
    );
  }
}