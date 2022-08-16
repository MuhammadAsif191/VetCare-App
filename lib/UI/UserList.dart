import 'package:flutter/material.dart';

class users {
  String userName;
  bool onlineNow;
  // String img;
  users(this.userName, this.onlineNow);
}

class userLists extends StatefulWidget {
  const userLists({Key? key}) : super(key: key);

  @override
  State<userLists> createState() => _userListsState();
}

List<users> obj = [
  users("Ihtisham", true),
  users("Ali", true),
  users("Farhana_but", false),
  users("Hussnain_guru", true),
  users("Sheraz_Khalid", true),
  users("Ihtisham", false),
  users("Ali", true),
  users("Farhana_but", false),
  users("Hussnain_guru", true),
  users("Sheraz_Khalid", false),
  users("Ihtisham", true),
  users("Ali", true),
  users("Farhana_but", false),
  users("Hussnain_guru", true),
  users("Sheraz_Khalid", true),
  users("Ihtisham", false),
  users("Ali", true),
  users("Farhana_but", false),
  users("Hussnain_guru", false),
  users("Sheraz_Khalid", true),
  users("Ihtisham", true),
  users("Ali", false),
  users("Farhana_but", false),
  users("Hussnain_guru", true),
  users("Sheraz_Khalid", true),
];
List<users> BlockedUser = [];

class _userListsState extends State<userLists> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obj.add(users("Sheraz_Khalid", true));

    BlockedUser = [];
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: obj.length,
      itemBuilder: (context, index) {
        return userAccess(
          userName: obj[index].userName,
          onlineNow: obj[index].onlineNow,
          ind: index,
        );
      },
    );
  }
}

class userAccess extends StatefulWidget {
  const userAccess({
    Key? key,
    this.userName = '',
    this.onlineNow = true,
    this.ind = -1,
  }) : super(key: key);
  final bool onlineNow;
  final String userName;
  final int ind;

  @override
  State<userAccess> createState() => _userAccessState();
}

class _userAccessState extends State<userAccess> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton(
              minWidth: double.infinity,
              onPressed: () {
                setState(() {
                  BlockedUser.add(obj[widget.ind]);
                  obj.removeAt(widget.ind);
                });
                Navigator.pop(context);
              },
              child: Text('Block'),
            ),
          ],
        ),
      ),
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
            title: Text(widget.userName),
            subtitle: widget.onlineNow == true
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
    );
  }
}
