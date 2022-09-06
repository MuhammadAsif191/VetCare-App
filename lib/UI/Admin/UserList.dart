import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class users {
  String userName;
  String onlineNow;
  // String img;
  users(this.userName, this.onlineNow);
}

class userLists extends StatefulWidget {
  const userLists({Key? key}) : super(key: key);

  @override
  State<userLists> createState() => _userListsState();
}

List<users> obj = [];
// List<users> BlockedUser = [];

class _userListsState extends State<userLists> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var app = FirebaseFirestore.instance.collection('users').get();

    app.then((QuerySnapshot querySnapshot) => {
          print("object"),
          obj = [],
          querySnapshot.docs.forEach((element) {
            print(element['name'] + element['status']);
            setState(() {
              obj.add(users(element['name'], element['status']));
            });
          })
        });

    // obj.add(users("Sheraz_Khalid", true));

    // BlockedUser = [];
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
    this.onlineNow = '',
    this.ind = -1,
  }) : super(key: key);
  final String onlineNow;
  final String userName;
  final int ind;

  @override
  State<userAccess> createState() => _userAccessState();
}

class _userAccessState extends State<userAccess> {
  @override
  void Delete(String name, String status) {
    var app = FirebaseFirestore.instance.collection('users').get();

    app.then((QuerySnapshot querySnapshot) => {
          obj = [],

          querySnapshot.docs.forEach((element) {
            //  element
            if (element["name"] == name) {
              FirebaseFirestore.instance
                  .collection("users")
                  .doc(element.id)
                  .update({"status": status});
            }
            // print(element.id);
          })
          // GetData();
        });
  }

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
                  // BlockedUser.add(obj[widget.ind]);
                  // obj.removeAt(widget.ind);
                });
                Navigator.pop(context);
                widget.onlineNow == 'Unblock'
                    ? Delete(widget.userName, "block")
                    : Delete(widget.userName, "Unblock");
              },
              child: widget.onlineNow == 'Unblock'
                  ? Text('block')
                  : Text('unblock'),
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
            subtitle: widget.onlineNow == 'Unblock'
                ? Text(
                    widget.onlineNow,
                    style: TextStyle(
                      color: Colors.green[400],
                    ),
                  )
                : Text(
                    '${widget.onlineNow}',
                    style: TextStyle(color: Colors.green[400]),
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
