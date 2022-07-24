import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ComplainData {
  final String person;
  final String currentTime;
  final String massage;
  ComplainData(this.person, this.massage, this.currentTime);
}

class postFeedback extends StatefulWidget {
  const postFeedback({Key? mykey, required this.DoctorName})
      : super(key: mykey);
  final String DoctorName;

  @override
  postFeedbackPage createState() => postFeedbackPage();
}

class postFeedbackPage extends State<postFeedback> {
  List<ComplainData> data = [];
  DateTime now = DateTime.now();
  String time = '02 AM';
  TextEditingController msgSent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          'Your feedback to ${widget.DoctorName}',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              // shrinkWrap: true,
              scrollDirection: Axis.vertical,
              // physics: ,
              itemCount: data.length,
              padding: EdgeInsets.only(top: 10, bottom: 10),
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
              height: 100,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: msgSent,
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        hintText: 'Write Feedback ....',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        DateTime now = DateTime.now();
                        time = now.hour.toString() +
                            ':' +
                            now.minute.toString() +
                            ' PM';
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
                  )
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
        margin: massageType == "receiver"
            ? EdgeInsets.fromLTRB(0, 0, 50, 0)
            : EdgeInsets.fromLTRB(50, 0, 0, 0),
        alignment:
            massageType == "receiver" ? Alignment.topLeft : Alignment.topRight,
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
                  alignment: Alignment.topLeft,
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 0),
                  child: Text(
                    massages,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding:
                      EdgeInsets.only(left: 0, right: 10, top: 10, bottom: 10),
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
