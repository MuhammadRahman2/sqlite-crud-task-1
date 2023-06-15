import 'dart:io';
import 'package:crud_sqflite/db/db.dart';
import 'package:crud_sqflite/model/user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({Key? key}) : super(key: key);

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {

  User user = User();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final _form = GlobalKey<FormState>();
  File? _imageFile;

  void imageSelect() async {
    final ImagePicker picker = ImagePicker();
    final pickImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickImage != null) {
      _imageFile = File(pickImage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Home page'),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              _imageFile == null
                  ? const CircleAvatar(radius: 50)
                  : CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(_imageFile!),
              ),
              TextButton.icon(
                onPressed: () {
                  imageSelect();
                },
                icon: const Icon(Icons.image),
                label: const Text('Select image'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: "Enter your Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintText: "Enter your phone Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            minimumSize: Size(MediaQuery.of(context).size.width * 06, 50)
                        ),
                        onPressed: (){
                          String imagePath = _imageFile!.path;
                          SqliteDatabaseHelper().insertUser(User(imageUrl: imagePath, name: nameController.text, phoneNumber: phoneController.text )).then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Add data ${nameController.text}')));
                          });

                        }, child: const Text('Add Data', style: TextStyle(color: Colors.white),),)
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}
