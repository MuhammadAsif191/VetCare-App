import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;
  const Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}

class makeCalls extends StatefulWidget {
  const makeCalls({Key? mykey, required this.DoctorName}) : super(key: mykey);
  final String DoctorName;

  @override
  makeCallToDoctorPage createState() => makeCallToDoctorPage();
}

class makeCallToDoctorPage extends State<makeCalls> {
  List<Message> message = [
    Message(
      text: 'Yes Sure',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      text: 'No don\'t worry',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 4)),
      isSentByMe: true,
    ),
    Message(
      text: 'great',
      date: DateTime.now().subtract(Duration(days: 4, minutes: 1)),
      isSentByMe: false,
    ),
  ];
  bool physicalMeeting = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    message;
    physicalMeeting = true;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: physicalMeeting
          ? GestureDetector(
              onTap: () {
                setState(() {
                  physicalMeeting = false;
                  message.add(
                    Message(
                      text: 'Please Arange physical Meeting',
                      date: DateTime.now()
                          .subtract(Duration(days: 3, minutes: 3)),
                      isSentByMe: false,
                    ),
                  );
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: 170,
                margin: EdgeInsets.only(
                    bottom: size.height - 220, right: size.width / 6),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Arange Meeting',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Container(),
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('${widget.DoctorName}'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.video_call),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
              padding: const EdgeInsets.all(8),
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
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
              itemBuilder: (context, Message message) => Align(
                alignment: message.isSentByMe
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Card(
                  color: message.isSentByMe ? Colors.white : Colors.green,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(message.text),
                  ),
                ),
              ),
            ),
          ),
          bottomBar(context),
        ],
      ),
    );
  }

  Widget bottomBar(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController chatValue = new TextEditingController();
    return Container(
      width: size.width,
      height: 60,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              controller: chatValue,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'Type your message here...',
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (chatValue.text != '')
                  message.add(
                    Message(
                      text: chatValue.text,
                      date: DateTime.now()
                          .subtract(Duration(days: 3, minutes: 3)),
                      isSentByMe: false,
                    ),
                  );
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
    );
  }
}
