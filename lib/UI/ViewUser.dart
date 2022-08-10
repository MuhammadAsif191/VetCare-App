import 'package:flutter/material.dart';
import 'package:vet_care_app/UI/UserProfileForDoctor.dart';
import 'DoctorMakeCall.dart';

class FlateUser {
  FlateUser(
    this.userName,
    this.onlineNow,
  );
  final String userName;
  final bool onlineNow;
}

final List<FlateUser> allData = [
  FlateUser(
    "Rizwan",
    true,
  ),
  FlateUser(
    "Sajid",
    false,
  ),
  FlateUser(
    "Maryam",
    true,
  ),
  FlateUser(
    "Ali",
    false,
  ),
];

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
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
            onlineNow: allData[index].onlineNow,
          );
        },
      ),
    );
  }
}

class UserComponent extends StatelessWidget {
  const UserComponent({
    Key? key,
    required this.onlineNow,
    required this.userName,
  }) : super(key: key);
  final String userName;
  final bool onlineNow;
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
            subtitle: onlineNow == true
                ? Text(
                    'Online',
                    style: TextStyle(
                      color: Colors.green[400],
                    ),
                  )
                : Text(''),
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
            ),
          ),
        );
      },
    );
  }
}
