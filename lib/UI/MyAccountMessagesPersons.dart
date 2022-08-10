import 'package:flutter/material.dart';
import 'MyAcountMessages.dart';

class UsersData {
  UsersData({required this.userImg, required this.userName});
  final String userName;
  final String userImg;
}

class MessagesPersons extends StatefulWidget {
  const MessagesPersons({Key? key}) : super(key: key);

  @override
  State<MessagesPersons> createState() => _MessagesPersonsState();
}

class _MessagesPersonsState extends State<MessagesPersons> {
  List<UsersData> data = [
    UsersData(userImg: 'images/Doctor.jpeg', userName: 'Qasim'),
    UsersData(userImg: 'images/Doctor.jpeg', userName: 'Asif'),
    UsersData(userImg: 'images/Doctor.jpeg', userName: 'Khalid'),
    UsersData(userImg: 'images/Doctor.jpeg', userName: 'sheraz'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Text('My Orders'),
      ),
      body: GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          // mainAxisSpacing: 10,
          childAspectRatio: 4.20,
        ),
        itemBuilder: ((context, index) => Persons(
              userImg: data[index].userImg,
              userName: data[index].userName,
            )),
      ),
    );
  }
}

class Persons extends StatelessWidget {
  const Persons({Key? key, required this.userImg, required this.userName})
      : super(key: key);
  final String userName;
  final String userImg;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => USerChatBox(shopName: userName),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Image.asset('images/Doctor.jpeg'),
            ),
            title: Text(
              userName,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
            endIndent: 15,
            indent: 15,
          ),
        ],
      ),
    );
  }
}
