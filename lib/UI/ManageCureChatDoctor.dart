import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:vet_care_app/UI/ProductDetail.dart';

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

class ManageCureDoctorMessageClassed extends StatefulWidget {
  const ManageCureDoctorMessageClassed({Key? mykey, required this.DoctorName})
      : super(key: mykey);
  final String DoctorName;

  @override
  ManageCureDoctorMessageClassedPage createState() =>
      ManageCureDoctorMessageClassedPage();
}

class ManageCureDoctorMessageClassedPage
    extends State<ManageCureDoctorMessageClassed> {
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
  bool meetingButton = true;
  TextEditingController meetingLocation = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    message;
    meetingLocation.text = '';
    meetingButton = true;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: meetingButton
          ? GestureDetector(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: TextField(
                                controller: meetingLocation,
                                decoration: InputDecoration(
                                  hintText: 'Enter Your Loacation...',
                                  labelText: 'Loaction',
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                  meetingButton = false;
                                  message.add(
                                    Message(
                                      text: meetingLocation.text,
                                      date: DateTime.now().subtract(
                                          Duration(days: 3, minutes: 3)),
                                      isSentByMe: false,
                                    ),
                                  );
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 15),
                                alignment: Alignment.center,
                                height: 50,
                                width: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green,
                                ),
                                child: Text('Submit Meeting'),
                              ),
                            ),
                          ],
                        ),
                      )),
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: 150,
                margin: EdgeInsets.fromLTRB(
                    0, 10, size.width / 4, size.height - 250),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text('Create Meeting'),
              ),
            )
          : Container(),
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('${widget.DoctorName}'),
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
