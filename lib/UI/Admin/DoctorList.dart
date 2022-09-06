import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vet_care_app/UI/smallDataModels/FlateListData.dart';

class doctors {
  String doctorName;
  String onlineNow;
  // String img;
  doctors(this.doctorName, this.onlineNow);
}

List<doctors> obj = [];

List<doctors> BlockedDoctor = [];
// List<doctors> obj2 = [];

class doctorLists extends StatefulWidget {
  const doctorLists({Key? key}) : super(key: key);

  @override
  State<doctorLists> createState() => _doctorListsState();
}

class _doctorListsState extends State<doctorLists> {
  // List<doctors> NewArray = [];
  @override
  void initState() {
    super.initState();
    var app = FirebaseFirestore.instance.collection('doctor').get();

    app.then((QuerySnapshot querySnapshot) => {
          obj = [],

          querySnapshot.docs.forEach((element) {
            //  element
            print(element['name']);
            setState(() {
              obj.add(doctors(element['name'], element['status']));
            });
          })
          // GetData();
        });
  }

  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: obj.length,
        itemBuilder: (context, index) {
          return doctorAccess(
            doctorName: obj[index].doctorName,
            onlineNow: obj[index].onlineNow,
            ind: index,
          );
        },
      ),
    );
  }
}

class doctorAccess extends StatefulWidget {
  const doctorAccess({
    Key? key,
    this.doctorName = '',
    this.onlineNow = '',
    this.ind = -1,
  }) : super(key: key);
  final String onlineNow;
  final String doctorName;
  final int ind;

  @override
  State<doctorAccess> createState() => _doctorAccessState();
}

class _doctorAccessState extends State<doctorAccess> {
  @override
  void Delete(String name, String status) {
    var app = FirebaseFirestore.instance.collection('doctor').get();

    app.then((QuerySnapshot querySnapshot) => {
          obj = [],

          querySnapshot.docs.forEach((element) {
            //  element
            if (element["name"] == name) {
              FirebaseFirestore.instance
                  .collection("doctor")
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
                widget.onlineNow == 'Unblock'
                    ? Delete(widget.doctorName, "block")
                    : Delete(widget.doctorName, "Unblock");
                Navigator.pop(context);
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
              title: Text(widget.doctorName),
              subtitle: Text(
                widget.onlineNow,
                style: TextStyle(
                  color: Colors.green[400],
                ),
              )),
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
