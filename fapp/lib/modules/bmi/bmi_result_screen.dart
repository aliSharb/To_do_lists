import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BmiResult extends StatelessWidget {
  bool ismale;
  double result;
  int age;

  BmiResult({
    required this.age,
    required this.ismale,
    required this.result,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(
          'Result',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Text(
            'Gender:${ismale ? 'Male' : 'Female'}',
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            'Age:$age',
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            'result:${result.round()}',
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
          )
        ],
      ),
    );
  }
}
