import 'package:crud_sqflite/views/add_Data_screen.dart';
import 'package:crud_sqflite/views/show_data_screen.dart';
import 'package:flutter/material.dart';

class RowCard extends StatelessWidget {
  final String? text1 ;
  final String? text2;
  final Function()? function1;
  final Function()? function2;
  const RowCard({Key? key, this.text1, this.text2 , this.function1, this.function2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: function1,
          child: Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 100,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10)),
              child:  Center(
                  child: Text(
                text1 ?? 'give a name',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              )),
            ),
          ),
        ),
        GestureDetector(
          onTap: function2,
          child: Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 100,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10)),
              child:  Center(
                child: Text(text2 ?? 'give a name',
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
