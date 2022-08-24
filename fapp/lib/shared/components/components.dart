import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fapp/shared/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget defButton({
  double width = double.infinity,
  Color backGround = Colors.blue,
  double hight = 40,
  required Function function,
  required String str,
  bool upper = true,
}) =>
    Container(
      color: backGround,
      height: hight,
      width: width,
      child: MaterialButton(
        child: Text(
            style: TextStyle(color: Colors.white),
            upper ? str.toUpperCase() : str),
        onPressed: () {
          function();
        },
      ),
    );

Widget defFormField({
  var controller,
  TextInputType keyboardType = TextInputType.text,
  IconData? prefix,
  IconData? Suffix,
  required String validMassage,
  required String lableText,
  bool obscureText = false,
  Function? suffixpressed,
  Function? ontab,
}) =>
    TextFormField(
        onTap: () {
          ontab!();
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefix: Icon(prefix),
          suffix: IconButton(
            icon: Icon(Suffix),
            onPressed: () {
              suffixpressed!();
            },
          ),
          labelText: lableText,
        ),
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) {
          if (value!.isEmpty) {
            return validMassage;
          } else {
            return null;
          }
        });

Widget bulidTask(context, {required Map model}) => Dismissible(
      onDismissed: (direction) {
        AppCubit.get(context).DeleteFromDatabase(id: model['id']);
      },
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text('${model['time']}'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateDatabase(status: 'Done', id: model['id']);
                },
                icon: Icon(Icons.done_rounded, color: Colors.green)),
            SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateDatabase(status: 'Arch', id: model['id']);
                },
                icon: Icon(Icons.archive, color: Colors.black)),
          ],
        ),
      ),
    );

Widget taskesBullder({required List<Map> task}) => ConditionalBuilder(
      fallback: (context) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.menu, size: 100),
              Text('No Tasks Yet ,please Add Tasks')
            ],
          ),
        );
      },
      condition: task.length > 0,
      builder: (context) {
        return ListView.separated(
            itemBuilder: (context, index) =>
                bulidTask(model: task[index], context),
            separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
            itemCount: task.length);
      },
    );
