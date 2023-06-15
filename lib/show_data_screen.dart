import 'dart:io';

import 'package:crud_sqflite/db/db.dart';
import 'package:crud_sqflite/model/user.dart';
import 'package:flutter/material.dart';

class ShowDataScreen extends StatefulWidget {
  @override
  _ShowDataScreenState createState() => _ShowDataScreenState();
}

class _ShowDataScreenState extends State<ShowDataScreen> {
  List<User> userList = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    List<User> users = await SqliteDatabaseHelper().getAllUsers();
    setState(() {
      userList = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          User user = userList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: FileImage(File(user.imageUrl.toString())),
            ),
            title: Text(user.name.toString()),
            subtitle: Text('ID: ${user.id}'),
          );
        },
      ),
    );
  }
}
