import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class AdminDoctorChatModel {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const AdminDoctorChatModel({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}

IO.Socket socket = IO.io('https://mix-chat-1.herokuapp.com/', <String, dynamic>{
  "transports": ["websocket"],
  "autoconnect": false,
});

class AdminDoctorChat extends StatefulWidget {
  const AdminDoctorChat(
      {Key? mykey,
      required this.DoctorName,
      required this.doctorMail,
      required this.userMail})
      : super(key: mykey);
  final String DoctorName;
  final String doctorMail;
  final String userMail;

  @override
  AdminDoctorChatPage createState() => AdminDoctorChatPage();
}

class AdminDoctorChatPage extends State<AdminDoctorChat> {
  List<AdminDoctorChatModel> message = [
    AdminDoctorChatModel(
      text: 'Yes Sure',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
      isSentByMe: false,
    ),
    AdminDoctorChatModel(
      text: 'No don\'t worry',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 4)),
      isSentByMe: true,
    ),
    AdminDoctorChatModel(
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
    Connect();
  }

  // void Connect() {
  // socket.connect();
  // socket.onConnect((data) => print(socket.id));
  // socket.emit("register", widget.doctorMail);
  // socket.onConnect((data) {
  //   print(socket.id);
  //   print(widget.doctorMail);
  //   print(widget.userMail + ">>" + widget.DoctorName);
  //   socket.on('private_chat', (msg) {
  //     print(msg);
  //     print(msg["message"]["msg"]);
  //     setState(() {
  //       message.add(AdminDoctorChatModel(
  //           text: msg["message"]["msg"],
  //           date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
  //           isSentByMe: true));
  //     });
  //   });
  // });
  void Connect() {
    print(widget.doctorMail);
    socket.connect();
    socket.onConnect((data) => print(socket.id));
    socket.emit("register", widget.doctorMail);
    socket.onConnect((data) {
      print(socket.id);
      socket.on('private_chat', (msg) {
        // console.log(msg);
        print(msg);
        setState(() {
          message.add(AdminDoctorChatModel(
              text: msg["message"]["msg"],
              date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
              isSentByMe: true));
        });
      });
      // });
    });
  }
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Admin'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<AdminDoctorChatModel, DateTime>(
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
              groupHeaderBuilder: (AdminDoctorChatModel message) => SizedBox(
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
              itemBuilder: (context, AdminDoctorChatModel message) => Padding(
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
      socket.emit('private_chat',
          {"user": user, "friend": "admin@gmail.com", "message": message});
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
                    AdminDoctorChatModel(
                      text: chatValue.text,
                      date: DateTime.now()
                          .subtract(Duration(days: 3, minutes: 3)),
                      isSentByMe: false,
                    ),
                  );
              });
              sendMessage(widget.doctorMail, widget.doctorMail, chatValue.text);
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
