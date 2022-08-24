// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
          ),
          title: Text('Ali Mohamed Sharb'),
          actions: [
            IconButton(
              onPressed: () {
                // ignore: avoid_print
                print('صباح الفل');
              },
              focusColor: Colors.grey,
              icon: Icon(
                Icons.notification_important,
              ),
              color: Color.fromARGB(255, 212, 99, 0),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
          backgroundColor: Color.fromARGB(255, 197, 33, 148),
          foregroundColor: Colors.lightGreenAccent,
          centerTitle: true,
          elevation: 789,
        ),
        body: Column(
          children: [
            Container(
              width: 200,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              padding: EdgeInsets.all(10),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnF2ud32tGZHGkLHrwMAYh42BmWcxRB0LgGQ&usqp=CAU'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    color: Colors.amber.withOpacity(0.5),
                    child: Text(
                      textAlign: TextAlign.center,
                      'hala ',
                      style: TextStyle(
                        color: Color.fromARGB(57, 62, 0, 46),
                        fontSize: 29,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
