import 'package:flutter/material.dart';

class adminComplaintsforDoctors {
  final String person;
  final String currentTime;
  final String massage;
  final String userName;
  adminComplaintsforDoctors(
      this.person, this.massage, this.currentTime, this.userName);
}

class complaintBoxforAdminDoctors extends StatefulWidget {
  @override
  _complaintBoxforAdminDoctors createState() => _complaintBoxforAdminDoctors();
}

class _complaintBoxforAdminDoctors extends State<complaintBoxforAdminDoctors> {
  List<adminComplaintsforDoctors> data = [
    adminComplaintsforDoctors("receiver", "hi", '02:15', "Ali"),
    adminComplaintsforDoctors("receiver", "how are you", '02:15', 'Ali'),
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
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.length,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                itemBuilder: (context, index) {
                  return messagePrintForAdminDoctors(
                    massageType: data[index].person,
                    massages: data[index].massage,
                    timeNow: data[index].currentTime,
                    userName: data[index].userName,
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
                      child: TextFormField(
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
                              adminComplaintsforDoctors(
                                "sender",
                                msgSent.text,
                                time,
                                "You",
                              ),
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
      ),
    );
  }
}

class messagePrintForAdminDoctors extends StatelessWidget {
  messagePrintForAdminDoctors({
    this.timeNow = '',
    this.massageType = '',
    this.massages = '',
    this.userName = '',
  });
  final String timeNow;
  final String userName;
  final String massageType;
  final String massages;
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
                      EdgeInsets.only(left: 10, right: 20, top: 3, bottom: 0),
                  child: (massageType == "receiver")
                      ? Text("From " + userName + " : ",
                          style: TextStyle(fontSize: 15))
                      : Text(
                          userName + " : ",
                          style: TextStyle(fontSize: 15),
                        ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
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
