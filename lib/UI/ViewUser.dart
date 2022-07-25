import 'package:flutter/material.dart';
import 'DoctorMakeCall.dart';

class FlateUser {
  FlateUser(
    this.userName,
    this.onlineNow,
    this.time,
  );
  final String userName;
  final bool onlineNow;
  final String time;
}

final List<FlateUser> allData = [
  FlateUser(
    "Rizwan",
    true,
    '12 PM',
  ),
  FlateUser(
    "Sajid",
    false,
    '10 PM',
  ),
  FlateUser(
    "Maryam",
    true,
    '09 AM',
  ),
  FlateUser("Ali", false, '01 AM'),
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
            time: allData[index].time,
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
    required this.time,
    required this.userName,
  }) : super(key: key);
  final String userName;
  final bool onlineNow;
  final String time;
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
            trailing: Text(
              time,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
            indent: 80,
            endIndent: 20,
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
