import 'package:flutter/material.dart';

class ComplaintStatus {
  final String complaint;
  final String DoctorName;
  ComplaintStatus(this.complaint, this.DoctorName);
}

class viewReports extends StatefulWidget {
  @override
  viewReportsPage createState() => viewReportsPage();
}

class viewReportsPage extends State<viewReports> {
  List<ComplaintStatus> data = [
    ComplaintStatus("hi", 'Dr.Hussnain'),
    ComplaintStatus("how are you", 'Dr.Ahmad'),
    ComplaintStatus('fake Doctor', 'Dr.Rizwan'),
  ];
  TextEditingController msgSent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          'Report',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              itemBuilder: (context, index) {
                return complaintBox(
                  complaint: data[index].complaint,
                  Name: data[index].DoctorName,
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class complaintBox extends StatelessWidget {
  complaintBox({
    this.Name = '',
    this.complaint = '',
  });
  String Name;
  String complaint;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 30, right: 0, top: 10, bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'From ' + Name + ":",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: Text(
                    "\t\t\t\t" + complaint,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
