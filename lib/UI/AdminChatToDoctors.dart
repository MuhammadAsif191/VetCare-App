import 'package:flutter/material.dart';

import 'AdminComplaintsToDoctors.dart';

class doctorsChat {
  String doctorName;
  String time;
  // String img;
  doctorsChat(this.doctorName, this.time);
}

class doctorsChatList extends StatefulWidget {
  const doctorsChatList({Key? key}) : super(key: key);

  @override
  State<doctorsChatList> createState() => _doctorsChatListState();
}

class _doctorsChatListState extends State<doctorsChatList> {
  List<doctorsChat> obj = [
    doctorsChat("Dr.Rizwan", "02:14 PM"),
    doctorsChat("Dr.Ali", "02:14 PM"),
    doctorsChat("Dr.Farhana", "02:14 PM"),
    doctorsChat("Dr.Hussnain", "02:14 PM"),
    doctorsChat("Dr.Rizwan", "02:14 PM"),
    doctorsChat("Dr.Ali", "02:14 PM"),
    doctorsChat("Dr.Farhana", "02:14 PM"),
    doctorsChat("Dr.Hussnain", "02:14 PM"),
    doctorsChat("Dr.Rizwan", "02:14 PM"),
    doctorsChat("Dr.Ali", "02:14 PM"),
    doctorsChat("Dr.Farhana", "02:14 PM"),
    doctorsChat("Dr.Hussnain", "02:14 PM"),
    doctorsChat("Dr.Rizwan", "02:14 PM"),
    doctorsChat("Dr.Ali", "02:14 PM"),
    doctorsChat("Dr.Farhana", "02:14 PM"),
    doctorsChat("Dr.Hussnain", "02:14 PM"),
    doctorsChat("Dr.Rizwan", "02:14 PM"),
    doctorsChat("Dr.Ali", "02:14 PM"),
    doctorsChat("Dr.Farhana", "02:14 PM"),
    doctorsChat("Dr.Hussnain", "02:14 PM"),
    doctorsChat("Dr.Rizwan", "02:14 PM"),
    doctorsChat("Dr.Ali", "02:14 PM"),
    doctorsChat("Dr.Farhana", "02:14 PM"),
    doctorsChat("Dr.Hussnain", "02:14 PM"),
    doctorsChat("Dr.Rizwan", "02:14 PM"),
    doctorsChat("Dr.Ali", "02:14 PM"),
    doctorsChat("Dr.Farhana", "02:14 PM"),
    doctorsChat("Dr.Hussnain", "02:14 PM"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: obj.length,
          itemBuilder: (context, index) {
            return doctorsComplaintChat(
              doctorName: obj[index].doctorName,
              time: obj[index].time,
            );
          },
        ),
      ),
    );
  }
}

class doctorsComplaintChat extends StatelessWidget {
  doctorsComplaintChat({
    this.doctorName = '',
    this.time = "02:38",
    // this.img = '',
  });
  final String doctorName;
  final String time;
  // String img;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => complaintBoxforAdminDoctors(),
          ),
        );
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
            title: Text(doctorName),
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
