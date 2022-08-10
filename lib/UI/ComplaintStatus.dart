import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class Message {
  final String text;
  final DateTime date;
  final String doctorName;
  const Message({
    required this.text,
    required this.date,
    required this.doctorName,
  });
}

class complaintsStatus extends StatefulWidget {
  @override
  complaintsStatusPage createState() => complaintsStatusPage();
}

class complaintsStatusPage extends State<complaintsStatus> {
  List<Message> message = [
    Message(
        text: 'Yes Sure',
        date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
        doctorName: 'Dr.Rizwan'),
    Message(
      text: 'No don\'t worry',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 4)),
      doctorName: 'Dr.Ali',
    ),
    Message(
      text: 'great',
      date: DateTime.now().subtract(Duration(days: 4, minutes: 1)),
      doctorName: 'Dr.Aysha',
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    message;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Complaint Status'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
              padding: const EdgeInsets.all(8),
              elements: message,
              groupBy: (message) => DateTime(
                message.date.year,
                message.date.month,
                message.date.day,
              ),
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: Colors.green[500],
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => Card(
                color: Colors.green,
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(5, 10, 40, 0),
                        child: Text(
                          message.doctorName.toString() + ' :',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
                        alignment: Alignment.topLeft,
                        child: Text(message.text),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
