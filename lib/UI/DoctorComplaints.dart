import 'package:flutter/material.dart';

class ComplainData {
  final String person;
  final String currentTime;
  final String massage;
  ComplainData(this.person, this.massage, this.currentTime);
}

class complaintsDoctors extends StatefulWidget {
  const complaintsDoctors({Key? mykey, required this.DoctorName})
      : super(key: mykey);
  final String DoctorName;

  @override
  complaintsDoctorsPage createState() => complaintsDoctorsPage();
}

class complaintsDoctorsPage extends State<complaintsDoctors> {
  List<ComplainData> data = [
    ComplainData("receiver", "you are not proper work", '02:15 AM'),
  ];
  DateTime now = DateTime.now();
  String time = '02 AM';
  TextEditingController msgSent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Complaints'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              // physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return MassagePrint(
                  massageType: data[index].person,
                  massages: data[index].massage,
                  timeNow: data[index].currentTime,
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
                  Expanded(
                    child: TextField(
                      minLines: 1,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      controller: msgSent,
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        DateTime now = DateTime.now();
                        time = now.hour.toString() + ' PM';
                        if (msgSent.text != '')
                          data.add(
                            ComplainData("sender", msgSent.text, time),
                          );
                        msgSent.text = '';
                      });
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.green[800],
                    elevation: 0,
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

class MassagePrint extends StatelessWidget {
  MassagePrint({
    this.timeNow = '',
    this.massageType = '',
    this.massages = '',
  });
  String timeNow;
  String massageType;
  String massages;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Align(
          alignment: (massageType == "receiver"
              ? Alignment.topLeft
              : Alignment.topRight),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (massageType == "receiver"
                  ? Colors.grey.shade200
                  : Colors.green[600]),
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 0),
                  child: Text(
                    massages,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 30, right: 0, top: 10, bottom: 10),
                  child: Text(
                    timeNow,
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
