import 'package:flutter/material.dart';

class feedbackData {
  // final bool aprove;
  final String complaint;
  final String UserName;
  feedbackData(this.complaint, this.UserName);
}

class feedbackDoctors extends StatefulWidget {
  @override
  feedbackDoctorPage createState() => feedbackDoctorPage();
}

class feedbackDoctorPage extends State<feedbackDoctors> {
  List<feedbackData> data = [
    feedbackData("hi", 'Hamza'),
    feedbackData("how are you", 'Sheraz'),
    feedbackData('fake Doctor', 'Ali'),
  ];
  TextEditingController msgSent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          'Feedback',
          style: TextStyle(
            fontSize: 15,
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
                  complaint: data[index].complaint,
                  Name: data[index].UserName,
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
              color: Colors.grey[350],
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 30, right: 0, top: 5, bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'From ' + Name + " : ",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
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
