import 'package:flutter/material.dart';

class users {
  String userName;
  String time;
  bool onlineNow;
  // String img;
  users(this.userName, this.time, this.onlineNow);
}

class userLists extends StatefulWidget {
  const userLists({Key? key}) : super(key: key);

  @override
  State<userLists> createState() => _userListsState();
}

class _userListsState extends State<userLists> {
  List<users> obj = [
    users("Ihtisham", "02:14 PM", true),
    users("Ali", "02:14 PM", true),
    users("Farhana_but", "02:14 PM", false),
    users("Hussnain_guru", "02:14 PM", true),
    users("Sheraz_Khalid", "02:14 PM", true),
    users("Ihtisham", "02:14 PM", false),
    users("Ali", "02:14 PM", true),
    users("Farhana_but", "02:14 PM", false),
    users("Hussnain_guru", "02:14 PM", true),
    users("Sheraz_Khalid", "02:14 PM", false),
    users("Ihtisham", "02:14 PM", true),
    users("Ali", "02:14 PM", true),
    users("Farhana_but", "02:14 PM", false),
    users("Hussnain_guru", "02:14 PM", true),
    users("Sheraz_Khalid", "02:14 PM", true),
    users("Ihtisham", "02:14 PM", false),
    users("Ali", "02:14 PM", true),
    users("Farhana_but", "02:14 PM", false),
    users("Hussnain_guru", "02:14 PM", false),
    users("Sheraz_Khalid", "02:14 PM", true),
    users("Ihtisham", "02:14 PM", true),
    users("Ali", "02:14 PM", false),
    users("Farhana_but", "02:14 PM", false),
    users("Hussnain_guru", "02:14 PM", true),
    users("Sheraz_Khalid", "02:14 PM", true),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: obj.length,
      itemBuilder: (context, index) {
        return userAccess(
          userName: obj[index].userName,
          onlineNow: obj[index].onlineNow,
          time: obj[index].time,
        );
      },
    );
  }
}

class userAccess extends StatelessWidget {
  userAccess({
    this.userName = '',
    this.onlineNow = true,
    this.time = "02:38",
    // this.img = '',
  });
  final String userName;
  final String time;
  final bool onlineNow;
  // String img;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      onLongPress: () {
        print(userName);
      },
      child: Column(
        children: [
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
    );
  }
}
