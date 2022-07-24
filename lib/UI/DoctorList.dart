import 'package:flutter/material.dart';
import 'package:vet_care_app/UI/FlateListData.dart';

class doctors {
  String doctorName;
  String time;
  bool onlineNow;
  // String img;
  doctors(this.doctorName, this.time, this.onlineNow);
}

class doctorLists extends StatefulWidget {
  const doctorLists({Key? key}) : super(key: key);

  @override
  State<doctorLists> createState() => _doctorListsState();
}

class _doctorListsState extends State<doctorLists> {
  List<doctors> obj = [
    doctors("Dr.Rizwan", "02:14 PM", true),
    doctors("Dr.Ali", "02:14 PM", true),
    doctors("Dr.Farhana", "02:14 PM", false),
    doctors("Dr.Hussnain", "02:14 PM", true),
    doctors("Dr.Rizwan", "02:14 PM", true),
    doctors("Dr.Ali", "02:14 PM", true),
    doctors("Dr.Farhana", "02:14 PM", false),
    doctors("Dr.Hussnain", "02:14 PM", true),
    doctors("Dr.Rizwan", "02:14 PM", true),
    doctors("Dr.Ali", "02:14 PM", true),
    doctors("Dr.Farhana", "02:14 PM", false),
    doctors("Dr.Hussnain", "02:14 PM", true),
    doctors("Dr.Rizwan", "02:14 PM", true),
    doctors("Dr.Ali", "02:14 PM", true),
    doctors("Dr.Farhana", "02:14 PM", false),
    doctors("Dr.Hussnain", "02:14 PM", true),
    doctors("Dr.Rizwan", "02:14 PM", true),
    doctors("Dr.Ali", "02:14 PM", true),
    doctors("Dr.Farhana", "02:14 PM", false),
    doctors("Dr.Hussnain", "02:14 PM", true),
    doctors("Dr.Rizwan", "02:14 PM", true),
    doctors("Dr.Ali", "02:14 PM", true),
    doctors("Dr.Farhana", "02:14 PM", false),
    doctors("Dr.Hussnain", "02:14 PM", true),
    doctors("Dr.Rizwan", "02:14 PM", true),
    doctors("Dr.Ali", "02:14 PM", true),
    doctors("Dr.Farhana", "02:14 PM", false),
    doctors("Dr.Hussnain", "02:14 PM", true),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: obj.length,
        itemBuilder: (context, index) {
          return doctorAccess(
            doctorName: obj[index].doctorName,
            onlineNow: obj[index].onlineNow,
            time: obj[index].time,
          );
        },
      ),
    );
  }
}

class doctorAccess extends StatelessWidget {
  doctorAccess({
    this.doctorName = '',
    this.onlineNow = true,
    this.time = "02:38",
    // this.img = '',
  });
  final String doctorName;
  final String time;
  final bool onlineNow;
  // String img;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      onLongPress: () {
        print(doctorName);
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
