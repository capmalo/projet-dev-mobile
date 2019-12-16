import 'dart:collection';
import 'dart:convert';
import 'API.dart';
import 'user.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  final appTitle = 'Users';
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
          User data = new User(user['login']['uuid'], user['name']['first'], user['email']);
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Random Users"),
        centerTitle: false,
      ),
      body: new Container(
        child: new FutureBuilder(
          //future: userDetails(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (users == null) {
              return new Center(
                child: new CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return new ListTile(
                    /*leading: new Hero(
                      /*tag: "image$index",
                      child: CircleAvatar(
                        backgroundImage:
                        new NetworkImage(snapshot.data[index].pictureSmall),
                      ),*/
                    ),*/
                    title: new Text(
                      users[index].name +
                          " " +
                          users[index].name,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //subtitle: new Text(snapshot.data[index].email),
                   /* trailing: new SizedBox(
                      height: 20.0,
                      child: new Image.asset(menOrWomen(snapshot.data[index].gender)),
                    ),*/
                    /*onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) =>
                              Details(snapshot.data[index], index),
                        ),
                      );
                    },*/
                  );
                },
              );
            }
          },
        ),
      ),
     /* floatingActionButton: new FloatingActionButton(
        tooltip: "Reload",
        child: new Icon(Icons.refresh),
        onPressed: () {
          _reload();
        },
      ),*/
    );
  }
}