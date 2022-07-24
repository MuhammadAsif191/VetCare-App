import 'package:flutter/material.dart';

class feedbackData {
  // final bool aprove;
  final int payment;
  final String UserName;
  final String times;
  feedbackData(this.payment, this.UserName, this.times);
}

class recievedPaymentDetail extends StatefulWidget {
  @override
  recievedPaymentDetailPage createState() => recievedPaymentDetailPage();
}

class recievedPaymentDetailPage extends State<recievedPaymentDetail> {
  List<feedbackData> data = [
    feedbackData(500, 'Hamza', "2:19 AM"),
    feedbackData(600, 'Sheraz', "5:15 PM"),
    feedbackData(2000, 'Ali', "12:04 PM"),
  ];
  TextEditingController msgSent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text(
          'Payment Detail',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              // physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return complaintBox(
                  payment: this.data[index].payment,
                  Name: this.data[index].UserName,
                  time: this.data[index].times,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class complaintBox extends StatelessWidget {
  complaintBox({
    this.Name = '',
    this.payment = 0,
    this.time = '',
  });
  String Name;
  int payment;
  String time;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[350],
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 30, right: 0, top: 5, bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Recieve From ' + Name + " : ",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
                  child: Text(
                    payment.toString(),
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.bottomEnd,
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
                  child: Text(
                    time,
                    style: TextStyle(
                      fontSize: 13,
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
