import 'package:flutter/material.dart';

class SellerChatData {
  final String person;
  final String currentTime;
  final String massage;
  SellerChatData(this.person, this.massage, this.currentTime);
}

class SellerChatBox extends StatefulWidget {
  const SellerChatBox({Key? mykey, required this.shopName}) : super(key: mykey);
  final String shopName;

  @override
  SellerChatBoxPage createState() => SellerChatBoxPage();
}

class SellerChatBoxPage extends State<SellerChatBox> {
  List<SellerChatData> data = [
    SellerChatData("receiver", "hi", '02:15'),
    SellerChatData("receiver", "how are you", '02:15'),
  ];
  DateTime now = DateTime.now();
  String time = '02 AM';
  TextEditingController msgSent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('${widget.shopName}'),
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
                return MassageDisplay(
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
                            SellerChatData("sender", msgSent.text, time),
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

class MassageDisplay extends StatelessWidget {
  MassageDisplay({
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
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
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
