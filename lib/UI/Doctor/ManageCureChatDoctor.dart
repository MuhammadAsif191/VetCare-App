import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../VideoCalling/videoCalling.dart';

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
  const ManageCureDoctorMessageClassed(
      {Key? mykey,
      required this.userMail,
      required this.DoctorName,
      required this.idname})
      : super(key: mykey);
  final String DoctorName;
  final String userMail;
  final String idname;

  @override
  ManageCureDoctorMessageClassedPage createState() =>
      ManageCureDoctorMessageClassedPage();
}

class ManageCureDoctorMessageClassedPage
    extends State<ManageCureDoctorMessageClassed> {
  List<Message> message = [];
  bool meetingButton = true;
  TextEditingController meetingLocation = new TextEditingController();
  IO.Socket socket =
      IO.io('https://mix-chat-1.herokuapp.com/', <String, dynamic>{
    "transports": ["websocket"],
    "autoconnect": false,
  });
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    message;
    meetingLocation.text = '';
    meetingButton = true;
    Connect();
  }

  void Connect() {
    socket.connect();
    socket.onConnect((data) => print(socket.id));
    socket.emit("register", widget.idname);
    socket.onConnect((data) {
      print(socket.id);
      print(widget.idname + ">>" + widget.userMail);
      socket.on('private_chat', (msg) {
        print(msg["message"]["msg"]);
        setState(() {
          message.add(Message(
              text: msg["message"]["msg"],
              date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
              isSentByMe: true));
        });
      });
    });
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => VideoCallingAction(
                        // channel_Name: channelName.text.trim(),
                        ),
                  ),
                );
              },
              icon: Icon(
                Icons.video_call_outlined,
              )),
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
              itemBuilder: (context, Message message) => Padding(
                padding: message.isSentByMe
                    ? EdgeInsets.only(right: 30.0)
                    : EdgeInsets.only(left: 30.0),
                child: Align(
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
          ),
          bottomBar(context),
        ],
      ),
    );
  }

  Widget bottomBar(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController chatValue = new TextEditingController();
    void sendMessage(user, friend, message) {
      socket.emit(
          'private_chat', {"user": user, "friend": friend, "message": message});
    }

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
                sendMessage(widget.idname, widget.userMail, chatValue.text);
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
