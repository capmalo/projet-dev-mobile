import 'package:flutter/material.dart';

class aProposPage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("A Propos"),
        ),
      body: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 70,right: 70,top: 10),
                child: Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/e/e7/Logo-Efrei-Paris-2017.jpg'),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text('This magnificent app is truthfully presented to you by :',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  //style: TextStyle(fontWeight: FontWeight.bold)
                ),
              ),
              Text('Malo FERNANDEZ',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold)
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text('and',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    //style: TextStyle(fontWeight: FontWeight.bold)
                ),
              ),
              Text("Théodore D'AVRAY",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold)
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 50),
                child: Text.rich(
                  TextSpan(
                    text: 'Les difficultées rencontrées :', style: TextStyle(fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(text: '\n- Ecriture dans les préférences utilisateur', style: TextStyle(fontWeight: FontWeight.normal)),
                      TextSpan(text: '\n- Utilisaton du json récupéré', style: TextStyle(fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 30),
                child: Text.rich(
                  TextSpan(
                    text: 'Les bibliothèques tierces utilisées :', style: TextStyle(fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(text: '\n- Bibliothèque 1', style: TextStyle(fontWeight: FontWeight.normal)),
                      TextSpan(text: '\n- Bibliothèque 2', style: TextStyle(fontWeight: FontWeight.normal)),
                    ],
                  ),
                 ),
              ),
            ],
          )
      )
    );
  }
}