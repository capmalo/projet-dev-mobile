import 'dart:convert';
import 'API.dart';
import 'user.dart';
import 'package:flutter/material.dart';
import 'userDetails.dart';

var appTitle = 'List Users';
bool initStatus = false;

class Users extends StatelessWidget {
  final appTitle = 'List Users';

  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListUsers(),
    );
  }
}

class ListUsers extends StatefulWidget {
  @override
  createState() => _ListUsersScreenState();
}

class _ListUsersScreenState extends State {
  var users = new List<User>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        var jsonData = json.decode(response.body);
        for (var user in jsonData['results']) {
          User data = new User(
              user['login']['uuid'],
              user['name']['first'],
              user['name']['last'],
              user['email'],
              user['login']['username'],
              user['name']['title'],
              user['dob']['age'],
              user['phone'],
              user['picture']['large'],
          );
          users.add(data);
        }
        /*String list = json.decode(response.body);
        print(listS);
        Iterable list = json.decode(listS);
        users = list.map((model) => User.fromJson(model)).toList();*/
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User list"),
          actions: <Widget>[IconButton(icon: Icon(Icons.help), onPressed: () {
            showDialog(context: context,builder: (BuildContext context) => _buildAboutDialog(context),
            );},),]
      ),
      body: new Container(
        child: new FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (users.length == 0) {
              return new Center(
                child: new CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return new ListTile(
                    title: new Text(
                      users[index].username,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: new Text(users[index].email),
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) =>
                              Details(users[index], index),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
     floatingActionButton: new FloatingActionButton(
        tooltip: "Reload",
        child: new Icon(Icons.refresh),
        onPressed: () {
          _getUsers();
        },
      ),
    );
  }

  Widget _buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('About this list'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('This list is provided by randomuser.me', style: const TextStyle(color: Colors.black87))
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {Navigator.of(context).pop();},
          textColor: Theme.of(context).primaryColor,
          child: const Text('Okay, got it!'),
        ),
      ],
    );
  }
}