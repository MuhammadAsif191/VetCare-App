import 'package:flutter/material.dart';
import 'package:vet_care_app/UI/UserComplaintsForAdmin.dart';
import 'view_Users_and_Doctor.dart';

class adminPanels extends StatefulWidget {
  const adminPanels({Key? key}) : super(key: key);

  @override
  State<adminPanels> createState() => _adminPanelsState();
}

class _adminPanelsState extends State<adminPanels> {
  int monitorDoctorNoti = 1;
  int userComplaints = 0;
  String adminName = "Sheraz_Khalid";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        centerTitle: true,
        title: Text("Admin Panel"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: size.width * 0.4,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: FlatButton(
                    child: UserCard(
                      text: "Monitor Doctor",
                      icon: Icon(Icons.man_sharp),
                      Notification: monitorDoctorNoti,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: size.width * 0.4,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: FlatButton(
                    child: UserCard(
                      text: "Users Complaints",
                      icon: Icon(Icons.comment_bank_rounded),
                      Notification: userComplaints,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => complaintBoxforAdmin(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  // alignment: Alignment.center,
                  child: UserCard(
                    text: "Access Doctor/User",
                    icon: Icon(Icons.supervisor_account_outlined),
                    // Notification: monitorDoctorNoti,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserAndDoctor(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  UserCard({
    this.text = '',
    this.Notification = 0,
    this.icon,
  });

  final String text;
  int Notification;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor:
                            Notification > 0 ? Colors.green : Colors.white,
                        child: Notification > 0
                            ? Text(Notification.toString())
                            : Text(''),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: icon,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(6, 10, 6, 10),
                alignment: Alignment.center,
                child: Text(text),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
