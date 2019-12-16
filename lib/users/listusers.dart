import 'dart:convert';
import 'API.dart';
import 'user.dart';
import 'package:flutter/material.dart';
import 'userDetails.dart';

var appTitle = 'List Users';

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
        title: Text("List Users"),
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
                      users[index].fname +
                          " " +
                          users[index].lname,
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
}