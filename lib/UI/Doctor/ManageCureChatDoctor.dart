import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../VideoCalling/videoCalling.dart';
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

List<Message> message = [];
IO.Socket socket = IO.io('https://mix-chat-1.herokuapp.com/', <String, dynamic>{
  "transports": ["websocket"],
  "autoconnect": false,
});

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    message = [];
    backupChat();
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

  Future<void> backupChat() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://mix-chat-1.herokuapp.com/pchat/backupsms'));
    request.body = json
        .jsonEncode({"username": widget.idname, "friendname": widget.userMail});
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
                  date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
                  isSentByMe: false),
            );
          });
        } else {
          setState(() {
            message.add(
              Message(
                  text: sms1[i]['msg'],
                  date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
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
    return Scaffold(
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
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Preseption(
                    idname: widget.idname,
                    userMail: widget.userMail,
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.description,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => PhysicalMeeting(
                    idname: widget.idname,
                    userMail: widget.userMail,
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.medical_services_outlined,
            ),
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
              itemBuilder: (context, Message message) => Padding(
                padding: message.isSentByMe
                    ? EdgeInsets.only(right: 30.0)
                    : EdgeInsets.only(left: 30.0),
                child: Align(
                  alignment: message.isSentByMe
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Card(
                    color: message.text.contains('Prescription')
                        ? Colors.grey[500]
                        : message.text.contains('Physical Meeting Location :')
                            ? Colors.blue
                            : message.isSentByMe
                                ? Colors.white
                                : Colors.green,
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

class Preseption extends StatefulWidget {
  Preseption({
    Key? key,
    required this.idname,
    required this.userMail,
  }) : super(key: key);
  final String idname;
  final String userMail;
  @override
  State<Preseption> createState() => _PreseptionState();
}

class _PreseptionState extends State<Preseption> {
  TextEditingController _inputControllerFirst = TextEditingController();
  TextEditingController _inputControllerSecond = TextEditingController();
  TextEditingController _inputControllerThird = TextEditingController();
  TextEditingController _inputControllerFourth = TextEditingController();
  String FirstPop = 'Select';
  String SecondPop = 'Select';
  String ThirdPop = 'Select';
  String FourthPop = 'Select';
  String FirstPopValue = 'Morning & AfterNoon & Night';
  String SecondPopValue = 'Morning & AfterNoon & Night';
  String ThirdPopValue = 'Morning & AfterNoon & Night';
  String FourthPopValue = 'Morning & AfterNoon & Night';

  @override
  String messagePreseption = '';
  Widget build(BuildContext context) {
    void sendMessage(user, friend, message) {
      socket.emit(
          'private_chat', {"user": user, "friend": friend, "message": message});
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Prescription'),
      ),
      body: ListView(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text('${FirstPop}'),
                ),
                Container(
                  child: PopupMenuButton(
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 20,
                    onSelected: (value) {
                      setState(() {
                        if (value == 1) {
                          FirstPop = 'Morning ';
                          FirstPopValue = 'Morning ';
                        }
                        if (value == 2) {
                          FirstPop = 'AfterNoon ';
                          FirstPopValue = 'AfterNoon ';
                        }
                        if (value == 3) {
                          FirstPop = 'Night ';
                          FirstPopValue = 'Night ';
                        }
                        if (value == 4) {
                          FirstPop = 'M & N ';
                          FirstPopValue = 'Morning & Night ';
                        }
                        if (value == 5) {
                          FirstPop = 'M & A & N ';
                          FirstPopValue = 'Morning & AfterNoon & Night';
                        }
                      });
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text('Morning'),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text('AfterNoon'),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text('Night'),
                      ),
                      PopupMenuItem(
                        value: 4,
                        child: Text('M&N'),
                      ),
                      PopupMenuItem(
                        value: 5,
                        child: Text('M&A&N'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 15.0),
                    child: TextField(
                      controller: _inputControllerFirst,
                      decoration: InputDecoration(
                        hintText: 'Enter Medicine For User ...',
                        label: Text('Medicine'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text('${SecondPop}'),
                ),
                Container(
                  child: PopupMenuButton(
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 20,
                    onSelected: (value) {
                      setState(() {
                        if (value == 1) {
                          setState(() {
                            SecondPop = 'Morning ';
                            SecondPopValue = 'Morning ';
                          });
                        }
                        if (value == 2) {
                          SecondPop = 'AfterNoon ';
                          SecondPopValue = 'AfterNoon ';
                        }
                        if (value == 3) {
                          SecondPop = 'Night ';
                          SecondPopValue = 'Night ';
                        }
                        if (value == 4) {
                          SecondPop = 'M & N ';
                          SecondPopValue = 'Morning & Night ';
                        }
                        if (value == 5) {
                          SecondPop = 'M & A & N ';
                          SecondPopValue = 'Morning & AfterNoon & Night';
                        }
                      });
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text('Morning'),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text('AfterNoon'),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text('Night'),
                      ),
                      PopupMenuItem(
                        value: 4,
                        child: Text('M&N'),
                      ),
                      PopupMenuItem(
                        value: 5,
                        child: Text('M&A&N'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 15.0),
                    child: TextField(
                      controller: _inputControllerSecond,
                      decoration: InputDecoration(
                        hintText: 'Enter Medicine For User ...',
                        label: Text('Medicine'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text('${ThirdPop}'),
                ),
                Container(
                  child: PopupMenuButton(
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 20,
                    onSelected: (value) {
                      setState(() {
                        if (value == 1) {
                          setState(() {
                            ThirdPop = 'Morning ';
                            ThirdPopValue = 'Morning ';
                          });
                        }
                        if (value == 2) {
                          ThirdPop = 'AfterNoon ';
                          ThirdPopValue = 'AfterNoon ';
                        }
                        if (value == 3) {
                          ThirdPop = 'Night ';
                          ThirdPopValue = 'Night ';
                        }
                        if (value == 4) {
                          ThirdPop = 'M & N ';
                          ThirdPopValue = 'Morning & Night ';
                        }
                        if (value == 5) {
                          ThirdPop = 'M & A & N ';
                          ThirdPopValue = 'Morning & AfterNoon & Night';
                        }
                      });
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text('Morning'),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text('AfterNoon'),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text('Night'),
                      ),
                      PopupMenuItem(
                        value: 4,
                        child: Text('M&N'),
                      ),
                      PopupMenuItem(
                        value: 5,
                        child: Text('M&A&N'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 15.0),
                    child: TextField(
                      controller: _inputControllerThird,
                      decoration: InputDecoration(
                        hintText: 'Enter Medicine For User ...',
                        label: Text('Medicine'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text('${FourthPop}'),
                ),
                Container(
                  child: PopupMenuButton(
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 20,
                    onSelected: (value) {
                      setState(() {
                        if (value == 1) {
                          setState(() {
                            FourthPop = 'Morning ';
                            FourthPopValue = 'Morning ';
                          });
                        }
                        if (value == 2) {
                          FourthPop = 'AfterNoon ';
                          FourthPopValue = 'AfterNoon ';
                        }
                        if (value == 3) {
                          FourthPop = 'Night ';
                          FourthPopValue = 'Night ';
                        }
                        if (value == 4) {
                          FourthPop = 'M & N ';
                          FourthPopValue = 'Morning & Night ';
                        }
                        if (value == 5) {
                          FourthPop = 'M & A & N ';
                          FourthPopValue = 'Morning & AfterNoon & Night';
                        }
                      });
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text('Morning'),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text('AfterNoon'),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text('Night'),
                      ),
                      PopupMenuItem(
                        value: 4,
                        child: Text('M&N'),
                      ),
                      PopupMenuItem(
                        value: 5,
                        child: Text('M&A&N'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 15.0),
                    child: TextField(
                      controller: _inputControllerFourth,
                      decoration: InputDecoration(
                        hintText: 'Enter Medicine For User ...',
                        label: Text('Medicine'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          GestureDetector(
            onTap: () {
              if ((_inputControllerFirst.text.trim() != '' &&
                      FirstPopValue != '') ||
                  (_inputControllerSecond.text.trim() != '' &&
                      SecondPopValue != '') ||
                  (_inputControllerThird.text.trim() != '' &&
                      ThirdPopValue != '') ||
                  (_inputControllerFourth.text.trim() != '' &&
                      FourthPopValue != '')) {
                setState(() {
                  if (_inputControllerFirst.text.trim() != '') {
                    messagePreseption = 'Prescription : \n';
                    messagePreseption = messagePreseption +
                        (' Medicine : ') +
                        _inputControllerFirst.text.trim() +
                        (' Time : ') +
                        FirstPopValue +
                        '\n';
                  }
                  if (_inputControllerSecond.text.trim() != '') {
                    messagePreseption = messagePreseption +
                        (' Medicine : ') +
                        _inputControllerSecond.text.trim() +
                        (' Time : ') +
                        SecondPopValue +
                        '\n';
                  }
                  if (_inputControllerThird.text.trim() != '') {
                    messagePreseption = messagePreseption +
                        (' Medicine : ') +
                        _inputControllerThird.text.trim() +
                        (' Time : ') +
                        ThirdPopValue +
                        '\n';
                  }
                  if (_inputControllerFourth.text.trim() != '') {
                    messagePreseption = messagePreseption +
                        (' Medicine : ') +
                        _inputControllerFourth.text.trim() +
                        (' Time : ') +
                        FourthPopValue +
                        '\n';
                  }
                });
                setState(() {
                  message.add(
                    Message(
                      text: messagePreseption,
                      date: DateTime.now()
                          .subtract(Duration(days: 3, minutes: 3)),
                      isSentByMe: false,
                    ),
                  );
                  sendMessage(
                      widget.idname, widget.userMail, messagePreseption);
                });
              }
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: 40.0,
                right: 40.0,
              ),
              decoration: BoxDecoration(
                  color: Colors.green[500],
                  borderRadius: BorderRadius.circular(16.0)),
              height: 60,
              width: 300,
              child: Text('Submit', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}

class PhysicalMeeting extends StatefulWidget {
  PhysicalMeeting({
    Key? key,
    required this.idname,
    required this.userMail,
  }) : super(key: key);
  final String idname;
  final String userMail;
  @override
  State<PhysicalMeeting> createState() => _PhysicalMeetingState();
}

class _PhysicalMeetingState extends State<PhysicalMeeting> {
  TextEditingController meetingTime = TextEditingController();
  TextEditingController meetingDate = TextEditingController();
  TextEditingController meetingLocation = TextEditingController();
  String timeValid = '';
  String dateValid = '';
  String meetingValid = '';
  @override
  String physicalMeetingLocation = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeValid = '';
    dateValid = '';
    meetingValid = '';
    physicalMeetingLocation = '';
  }

  void sendMessage(user, friend, message) {
    socket.emit(
        'private_chat', {"user": user, "friend": friend, "message": message});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.green[800],
          centerTitle: true,
          title: Text('Arange Physical Meeting')),
      body: ListView(
        children: <Widget>[
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: meetingTime,
                          decoration: InputDecoration(
                            hintText: 'Time ...',
                            label: Text(
                              'Time*',
                            ),
                          ),
                        ),
                        Text(
                          timeValid,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: TextField(
                            controller: meetingDate,
                            decoration: InputDecoration(
                              hintText: 'Date ...',
                              label: Text('Date*'),
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            dateValid,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: TextField(
              controller: meetingLocation,
              decoration: InputDecoration(
                hintText: 'Location*',
                label: Text('Enter Your Meeting Location ...'),
              ),
            ),
          ),
          Container(
            child: Text(
              meetingValid,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                timeValid = '';
                dateValid = '';
                meetingValid = '';
                setState(() {
                  if (meetingTime.text.trim() == '')
                    timeValid = 'Must fill ...';
                  if (meetingDate.text.trim() == '') dateValid = 'Must fill';
                  if (meetingLocation.text.trim() == '')
                    meetingValid = 'Must fill';
                });
              });
              if ((meetingTime.text.trim() != '') &&
                  (meetingDate.text.trim() != '') &&
                  (meetingLocation.text.trim() != '')) {
                setState(() {
                  physicalMeetingLocation =
                      'Physical Meeting Location : ' + '\n';
                  physicalMeetingLocation +=
                      'Time : ' + meetingTime.text.trim() + '\n';
                  physicalMeetingLocation +=
                      'Date : ' + meetingDate.text.trim() + '\n';
                  physicalMeetingLocation +=
                      'Location : ' + meetingLocation.text.trim();
                });
                setState(() {
                  message.add(
                    Message(
                      text: physicalMeetingLocation,
                      date: DateTime.now()
                          .subtract(Duration(days: 3, minutes: 3)),
                      isSentByMe: false,
                    ),
                  );
                  sendMessage(
                      widget.idname, widget.userMail, physicalMeetingLocation);
                });
              }
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: 40.0,
                right: 40.0,
              ),
              decoration: BoxDecoration(
                  color: Colors.green[500],
                  borderRadius: BorderRadius.circular(16.0)),
              height: 60,
              width: 300,
              child: Text('Submit', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
