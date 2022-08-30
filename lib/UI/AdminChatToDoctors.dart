import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'AdminComplaintsToDoctors.dart';

class doctorsChat {
  String doctorName;
  // String img;
  doctorsChat(this.doctorName);
}

class doctorsChatList extends StatefulWidget {
  const doctorsChatList({Key? key}) : super(key: key);

  @override
  State<doctorsChatList> createState() => _doctorsChatListState();
}

class _doctorsChatListState extends State<doctorsChatList> {
  List<doctorsChat> obj = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var app = FirebaseFirestore.instance.collection('doctor').get();

    app.then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((element) {
            print(element['email']);
            setState(() {
              // obj.add(doctorsChat(doctorName: element['name']));
              obj.add(doctorsChat(element['name']));
            });
            // GetData();
          })
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Text("Doctors"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: obj.length,
          itemBuilder: (context, index) {
            return doctorsComplaintChat(
              doctorName: obj[index].doctorName,
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
    // this.img = '',
  });
  final String doctorName;
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
