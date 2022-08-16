import 'package:flutter/material.dart';
import 'package:vet_care_app/UI/FlateListData.dart';

class doctors {
  String doctorName;
  bool onlineNow;
  // String img;
  doctors(this.doctorName, this.onlineNow);
}

List<doctors> obj = [
  doctors("Dr.Rizwan", true),
  doctors("Dr.Ali", true),
  doctors("Dr.Farhana", false),
  doctors("Dr.Hussnain", true),
  doctors("Dr.Rizwan", true),
  doctors("Dr.Ali", true),
  doctors("Dr.Farhana", false),
  doctors("Dr.Hussnain", true),
  doctors("Dr.Rizwan", true),
  doctors("Dr.Ali", true),
  doctors("Dr.Farhana", false),
  doctors("Dr.Hussnain", true),
  doctors("Dr.Rizwan", true),
  doctors("Dr.Ali", true),
  doctors("Dr.Farhana", false),
  doctors("Dr.Hussnain", true),
  doctors("Dr.Rizwan", true),
  doctors("Dr.Ali", true),
  doctors("Dr.Farhana", false),
  doctors("Dr.Hussnain", true),
  doctors("Dr.Rizwan", true),
  doctors("Dr.Ali", true),
  doctors("Dr.Farhana", false),
  doctors("Dr.Hussnain", true),
  doctors("Dr.Rizwan", true),
  doctors("Dr.Ali", true),
  doctors("Dr.Farhana", false),
  doctors("Dr.Hussnain", true),
];
List<doctors> BlockedDoctor = [];

class doctorLists extends StatefulWidget {
  const doctorLists({Key? key}) : super(key: key);

  @override
  State<doctorLists> createState() => _doctorListsState();
}

class _doctorListsState extends State<doctorLists> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obj.add(doctors("Dr.Hassan", true));
    BlockedDoctor = [];
  }

  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
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
    this.onlineNow = true,
    this.ind = -1,
  }) : super(key: key);
  final bool onlineNow;
  final String doctorName;
  final int ind;

  @override
  State<doctorAccess> createState() => _doctorAccessState();
}

class _doctorAccessState extends State<doctorAccess> {
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
                  BlockedDoctor.add(obj[widget.ind]);
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
            title: Text(widget.doctorName),
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
