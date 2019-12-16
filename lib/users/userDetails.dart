import 'package:flutter/material.dart';
import 'user.dart';

class Details extends StatelessWidget {
  final User user;
  final int index;
  final appTitle = 'Ajout / modification d\'une note';

  Details(this.user, this.index);
  Widget _spacing(BuildContext context) {
    final responsive = MediaQuery.of(context).size.height;
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new SizedBox(
            height: responsive * 0.01,
            width: 500.0,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double responsive = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:(){Navigator.pop(context, false); }),
        title: Text(user.fname + " " + user.lname),
      ),
      body: new ListView(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.all(0.0),
                height: responsive * 0.2,
                decoration: new BoxDecoration(
                    image: DecorationImage(
                  image:
                      NetworkImage("https://upload.wikimedia.org/wikipedia/commons/e/e7/Logo-Efrei-Paris-2017.jpg"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  repeat: ImageRepeat.noRepeat,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  padding: new EdgeInsets.only(top: responsive * 0.20),
                  child: new Card(
                    child: Container(
                      padding: new EdgeInsets.only(
                          top: responsive * 0.15, bottom: responsive * 0.05),
                      child: new Column(
                        children: <Widget>[
                          Center(
                            child: new Text(
                              user.fname + " " + user.lname,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40.0),
                            ),
                          ),
                          _spacing(context),
                          new Text("email : " + user.email),
                          _spacing(context),
                          new Text("Phone number : " + user.phonenum),
                          _spacing(context),
                          new Text("Age : " + user.age.toString(),),
                          _spacing(context),
                          _spacing(context),
                        ],
                      ),
                    ),
                    elevation: 5.0,
                  ),
                ),
              ),
              Card(
                elevation: 10.0,
                shape: CircleBorder(),
                color: Colors.transparent,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: responsive * 0.02),
                  child: new Center(
                    child: new Hero(
                      tag: "image$index",
                      child: CircleAvatar(
                        radius: 100.0,
                        backgroundImage: new NetworkImage(user.picture),
                      ),
                    ),
                  ),
                ),
              ),
              new Container(
                padding: EdgeInsets.only(
                    top: responsive * 0.2,
                    left: MediaQuery.of(context).size.width * 0.85),
              )
            ],
          )
        ],
      ),
    );
  }
}