import 'package:flutter/material.dart';

class ComplaintStatus {
  final bool aprove;
  final String complaint;
  final String DoctorName;
  final String currentTime;
  ComplaintStatus(
      this.aprove, this.complaint, this.DoctorName, this.currentTime);
}

class complaintsStatus extends StatefulWidget {
  @override
  complaintsStatusPage createState() => complaintsStatusPage();
}

class complaintsStatusPage extends State<complaintsStatus> {
  List<ComplaintStatus> data = [
    ComplaintStatus(false, "hi", 'Dr.Hussnain', "03:25"),
    ComplaintStatus(true, "how are you", 'Dr.Ahmad', "03:25"),
    ComplaintStatus(false, 'fake Doctor', 'Dr.Rizwan', "03:24"),
  ];
  TextEditingController msgSent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          'Complaint Status',
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
              // physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return complaintBox(
                    complaintAprove: data[index].aprove,
                    complaint: data[index].complaint,
                    Name: data[index].DoctorName,
                    times: data[index].currentTime);
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
    this.complaintAprove = false,
    this.complaint = '',
    this.times = '',
  });
  String Name;
  bool complaintAprove;
  String complaint;
  String times;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Align(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (complaintAprove == false
                  ? Colors.grey.shade200
                  : Colors.green[600]),
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 30, right: 0, top: 10, bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Complaint To ' + Name + ":",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    "\t\t\t\t" + complaint,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding:
                      EdgeInsets.only(left: 0, right: 10, top: 10, bottom: 10),
                  child: Text(
                    times,
                    style: TextStyle(
                      fontSize: 10,
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
