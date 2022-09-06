import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vet_care_app/UI/Doctor/UserProfileForDoctor.dart';

class FlateUser {
  FlateUser(
    this.userName,
    this.email,
  );
  final String userName;
  final String email;
}

List<FlateUser> allData = [
  FlateUser(
    "Rizwan",
    'rizwan@gmail.com',
  ),
];

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  void initState() {
    super.initState();
    var app = FirebaseFirestore.instance.collection('doctor').get();

    app.then((QuerySnapshot querySnapshot) => {
          setState(() {
            allData = [];
          }),
          querySnapshot.docs.forEach((element) {
            // print(element['email']);
            setState(() {
              allData.add(FlateUser(element['name'], element['email']));
            });
          })
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Users Details'),
      ),
      body: ListView.builder(
        itemCount: allData.length,
        itemBuilder: (context, index) {
          return UserComponent(
            userName: allData[index].userName,
            email: allData[index].email,
          );
        },
      ),
    );
  }
}

class UserComponent extends StatelessWidget {
  const UserComponent({
    Key? key,
    required this.email,
    required this.userName,
  }) : super(key: key);
  final String userName;
  final String email;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[100],
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              child: Icon(Icons.punch_clock),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            title: Text(userName),
          ),
          Divider(
            height: 0,
            thickness: 1,
            indent: 80,
            endIndent: 20,
          ),
        ],
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserProfile(
              userName: userName,
              email: email,
            ),
          ),
        );
      },
    );
  }
}
