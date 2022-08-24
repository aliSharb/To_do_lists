import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../models/users/user.dart';

class Users_Screen extends StatelessWidget {
  List<UserModle> users = [
    UserModle(
      id: 1,
      name: 'ali',
      phone: '12345',
    ),
    UserModle(
      id: 2,
      name: 'ali moh',
      phone: '123454325',
    ),
    UserModle(
      id: 3,
      name: 'ali abdalah',
      phone: '1234511111',
    ),
    UserModle(
      id: 1,
      name: 'ali',
      phone: '12345',
    ),
    UserModle(
      id: 2,
      name: 'ali moh',
      phone: '123454325',
    ),
    UserModle(
      id: 3,
      name: 'ali abdalah',
      phone: '1234511111',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              style: TextStyle(
                color: Colors.black12,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              'Users'),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => BulidUserItem(users[index]),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length,
        ));
  }
}

Widget BulidUserItem(UserModle user) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.0,
            child: Text(
              '${user.id}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.name}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('${user.phone}'),
            ],
          ),
        ],
      ),
    );
