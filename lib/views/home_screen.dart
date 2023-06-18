import 'dart:io';

import 'package:crud_sqflite/views/add_Data_screen.dart';
import 'package:crud_sqflite/db/db.dart';
import 'package:crud_sqflite/model/user.dart';
import 'package:crud_sqflite/views/show_data_screen.dart';
import 'package:crud_sqflite/widgets/rowcard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Note App'),
      ),
      body: Column(
        children: [
         RowCard(text1:  'Add Data',
           function1:() {
             Navigator.push(context,
                 MaterialPageRoute(builder: (_) => const AddDataScreen()));
           },
           text2: 'Show Data',
           function2: () {
             Navigator.push(
                 context, MaterialPageRoute(builder: (_) => ShowDataScreen()));
           },
         ),
        ],
      ),
        );
  }

}
