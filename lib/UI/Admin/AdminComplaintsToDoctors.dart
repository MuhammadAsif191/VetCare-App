import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

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

IO.Socket socket = IO.io('https://mix-chat-1.herokuapp.com/', <String, dynamic>{
  "transports": ["websocket"],
  "autoconnect": false,
});

class complaintBoxforAdminDoctors extends StatefulWidget {
  complaintBoxforAdminDoctors({required this.email});
  String email;

  @override
  _complaintBoxforAdminDoctors createState() => _complaintBoxforAdminDoctors();
}

class _complaintBoxforAdminDoctors extends State<complaintBoxforAdminDoctors> {
  String adminEmail = 'admin@gmail.com';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    message = [];
    backupChat();
    Connect();
  }

  void Connect() {
    print(adminEmail);
    socket.connect();
    socket.onConnect((data) => print(socket.id));
    socket.emit("register", adminEmail);
    socket.onConnect((data) {
      print(socket.id);
      socket.on('private_chat', (msg) {
        // console.log(msg);
        print(msg);
        setState(() {
          message.add(Message(
              text: msg["message"]["msg"],
              date: DateTime.now().subtract(Duration()),
              isSentByMe: true));
        });
      });
      // });
    });
  }

  Future<void> backupChat() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://mix-chat-1.herokuapp.com/pchat/backupsms'));
    request.body = json.jsonEncode(
        {"username": "admin@gmail.com", "friendname": widget.email});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var sms = json.jsonDecode(await response.stream.bytesToString()) as Map;
      var sms1 = sms['sms'];
      for (int i = 0; i < sms1.length; i++) {
        print(sms1[i]['msg'] + '>>>' + sms1[i]['status'] + '\n');
        if (sms1[i]['status'] == 'out') {
          setState(() {
            message.add(
              Message(
                  text: sms1[i]['msg'],
                  date: DateTime.now().subtract(Duration(
                    days: 1,
                  )),
                  isSentByMe: false),
            );
          });
        } else {
          setState(() {
            message.add(
              Message(
                  text: sms1[i]['msg'],
                  date: DateTime.now().subtract(Duration()),
                  isSentByMe: true),
            );
          });
        }
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Complaints To Doctor'),
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
      print(friend);
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
                      date: DateTime.now().subtract(Duration()),
                      isSentByMe: false,
                    ),
                  );
              });
              sendMessage("admin@gmail.com", widget.email, chatValue.text);
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
