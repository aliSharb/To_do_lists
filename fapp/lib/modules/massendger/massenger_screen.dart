import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore: use_key_in_widget_constructors
class MassengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWa_mSYTg_P-1pv0oHrz_bzb8Tg_iNGquWwQ&usqp=CAU')),
            SizedBox(width: 15),
            Text(
              'Chat',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                  backgroundColor: Colors.blue, child: Icon(Icons.edit))),
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.camera_alt_outlined)))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.cyan),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 15,
                      ),
                      Text('search'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => BuliedStoryItem(),
                  separatorBuilder: (context, indix) => SizedBox(width: 15),
                  itemCount: 5,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => BulidChatItem(),
                  separatorBuilder: (context, indix) => SizedBox(height: 20),
                  itemCount: 9)
            ],
          ),
        ),
      ),
    );
  }

  Widget BulidChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 33,
                backgroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/b/b8/Ali_Ma%C3%A2loul_VS_C.F._Monterrey_in_2021_FIFA_Club_World_Cup_%28cropped%29.jpg'),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 7,
              ),
              CircleAvatar(
                radius: 5,
                backgroundColor: Colors.red,
              )
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'عم الناس',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                ),
                Row(
                  children: [
                    Text(
                      'good Morning',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blueAccent),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text('20/10/2022')
                  ],
                )
              ],
            ),
          )
        ],
      );
  Widget BuliedStoryItem() => Container(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8HBbWbGzxKXBX8vOSObIisYKZ70_q8VRQmA&usqp=CAU'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 7,
                ),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 32, 174, 36),
                  radius: 5,
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Ronaldo',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}
