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
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(users[index].name));
          },
        ));
  }
}