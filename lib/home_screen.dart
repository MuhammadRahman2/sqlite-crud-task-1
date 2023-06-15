import 'dart:io';

import 'package:crud_sqflite/add_Data_screen.dart';
import 'package:crud_sqflite/db/db.dart';
import 'package:crud_sqflite/model/user.dart';
import 'package:crud_sqflite/show_data_screen.dart';
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
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AddDataScreen()));
                },
                child: Expanded(
                  child: Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(child: Text('Add Data')),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ShowDataScreen()));
                },
                child: Expanded(
                  child:Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Center(child: Text('Show data')),
                  ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
        );
  }

}
