import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vet_care_app/UI/ManageCureChatDoctor.dart';

class FlateListRecientUser {
  FlateListRecientUser(
    this.userName,
    this.email,
    this.onlineNow,
  );
  final String userName;
  final bool onlineNow;
  final String email;
}

class ManageCureDoctorWithRecientUsers extends StatefulWidget {
  ManageCureDoctorWithRecientUsers({required this.idname});
  final String idname;
  @override
  State<ManageCureDoctorWithRecientUsers> createState() =>
      _ManageCureDoctorWithRecientUsersPage();
}

class _ManageCureDoctorWithRecientUsersPage
    extends State<ManageCureDoctorWithRecientUsers> {
  List<FlateListRecientUser> allData = [];

  List<FlateListRecientUser> foundList = [];
  TextEditingController searchController = TextEditingController();
  Icon CostumIcon = Icon(Icons.search);
  bool IconControl = false;
  Widget TextInput = Text(
    'Manage Cure',
    style: TextStyle(
      fontSize: 18,
    ),
  );
  @override
  void initState() {
    super.initState();
    var app = FirebaseFirestore.instance.collection('users').get();

    app.then((QuerySnapshot querySnapshot) => {
          allData = [],
          querySnapshot.docs.forEach((element) {
            setState(() {
              allData.add(FlateListRecientUser(
                  element["name"], element['email'], false));
            });
          })
          // GetData();
        });
    setState(() {
      foundList = allData;
    });
  }

  onSearch(String search) {
    setState(() {
      foundList = allData
          .where((FlateListRecientUser) => FlateListRecientUser.userName
              .toLowerCase()
              .contains(search.toLowerCase()))
          .toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        title: TextInput,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              IconControl = !IconControl;
              setState(
                () {
                  if (IconControl) {
                    CostumIcon = Icon(Icons.cancel_outlined);
                    TextInput = TextField(
                      controller: searchController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: UnderlineInputBorder(),
                        labelText: "Search doctor name",
                      ),
                      onChanged: (Text) => onSearch(Text),
                    );
                  } else {
                    CostumIcon = Icon(Icons.search);
                    TextInput = Text(
                      'Post Solution',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    );
                    searchController.text = '';
                    setState(() {
                      foundList = allData;
                    });
                  }
                },
              );
            },
            icon: CostumIcon,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'Users',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: allData.length > 0
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: allData.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return RecientUsersList(
                                  email: allData[index].email,
                                  userName: allData[index].userName,
                                  onlineNow: allData[index].onlineNow,
                                  idname: widget.idname);
                            },
                          )
                        : Center(
                            child: Text(
                              'Oops...\nDoctor not found.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          )),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          )
        ],
      ),
    );
  }
}

class RecientUsersList extends StatelessWidget {
  RecientUsersList(
      {required this.userName,
      required this.email,
      required this.onlineNow,
      required this.idname});
  final String userName;
  final String email;
  final bool onlineNow;
  final String idname;
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
            builder: (context) => ManageCureDoctorMessageClassed(
              userMail: email,
              DoctorName: userName,
              idname: idname,
            ),
          ),
        );
      },
    );
  }
}
