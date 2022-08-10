import 'package:flutter/material.dart';

class QuestionAnswerData {
  QuestionAnswerData({
    required this.raw,
    required this.message,
    required this.name,
    required this.time,
  });
  bool raw;
  String name;
  String message;
  String time;
}

class MyAcountQuestionAndAnswer extends StatefulWidget {
  const MyAcountQuestionAndAnswer({Key? key}) : super(key: key);

  @override
  State<MyAcountQuestionAndAnswer> createState() =>
      _MyAcountQuestionAndAnswerState();
}

class _MyAcountQuestionAndAnswerState extends State<MyAcountQuestionAndAnswer> {
  String ShopName = "thrilers";
  List<QuestionAnswerData> data = [
    QuestionAnswerData(
        message: 'I have an error during delivery.',
        raw: false,
        name: 'Qasim',
        time: '02:35'),
    QuestionAnswerData(
        message: 'I have an error during delivery.',
        raw: true,
        name: 'Qasim',
        time: '02:35'),
  ];
  // DateTime now = DateTime.now();
  String time = '02 AM';
  TextEditingController msgSent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Text('Q&A'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
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
                return MyAcountMassageDisplay(
                  massageType: data[index].raw,
                  massages: data[index].message,
                  timeNow: data[index].time,
                  name: data[index].name,
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
                      // minLines: 1,
                      // maxLines: 5,
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
                            QuestionAnswerData(
                                raw: true,
                                message: msgSent.text,
                                time: time,
                                name: ShopName),
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

class MyAcountMassageDisplay extends StatelessWidget {
  MyAcountMassageDisplay({
    this.name = '',
    this.timeNow = '',
    this.massageType = false,
    this.massages = '',
  });
  String name;
  String timeNow;
  bool massageType;
  String massages;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: massageType == false
          ? Icon(Icons.quora_rounded)
          : Icon(Icons.question_answer_outlined),
      title: Text(massages),
      subtitle: Text(name + "\t" + timeNow),
    );
  }
}
