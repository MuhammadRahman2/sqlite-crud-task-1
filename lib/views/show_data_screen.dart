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
        title: const Text('User Data'),
      ),
      body: userList.isEmpty ?
        const Center(child: Text('User data is empty'),)
       : ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          User user = userList[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(File(user.imageUrl.toString())),
              ),
              title: Text(user.name.toString()),
              subtitle: Text('Phone No: ${user.phoneNumber}'),
              trailing: PopupMenuButton(
                onSelected: (String value) {
                  if (value == 'delete') {
                    // Handle delete action
                    SqliteDatabaseHelper().deleteData(user.id!.toInt()).then((value) => _loadUsers());
                  } else if (value == 'update') {
                    _showBottomSheet(context, user.id!.toInt(), user.name.toString(),
                        user.phoneNumber.toString(), user.imageUrl.toString());
                  }
                },
                itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                      value: 'delete',
                      child: Text('delete')),
                  const PopupMenuItem(
                    value: 'update',
                      child: Text('update')),

                ];
              },)
            ),
          );
        },
      ),
    );
  }
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  void _showBottomSheet(BuildContext context,int id, String name, String phoneNumber, String imageUrl) {
    nameController.text = name;
    // or
    // final nameController = TextEditingController(text: name);
    phoneController.text = phoneNumber;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              TextField(
                controller: nameController,
              ),
              SizedBox(height: 10),
              TextField(
                controller: phoneController,
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle update action
                  SqliteDatabaseHelper().updateData(User(id:  id, name: nameController.text, phoneNumber: phoneController.text, imageUrl:  imageUrl)).then((value) {
                    print('Data updated successfully');
                    _loadUsers();
                    Navigator.pop(context);
                  });
                },
                child: Text('Update'),
              ),
            ],
          ),
        );
      },
    );
  }
}
