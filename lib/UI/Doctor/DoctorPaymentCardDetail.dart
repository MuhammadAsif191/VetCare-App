import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:grouped_list/grouped_list.dart';

class Message {
  final DateTime date;
  final String doctorName;
  const Message({
    required this.date,
    required this.doctorName,
  });
}

class DoctorAddPaymentsDetail extends StatefulWidget {
  DoctorAddPaymentsDetail({Key? key}) : super(key: key);

  @override
  State<DoctorAddPaymentsDetail> createState() =>
      _DoctorAddPaymentsDetailPage();
}

class _DoctorAddPaymentsDetailPage extends State<DoctorAddPaymentsDetail> {
  // UserData obj = UserData();
  TextEditingController nameCardController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Payment Details'),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: ((context) => Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: TextField(
                          controller: nameCardController,
                          decoration: InputDecoration(
                            labelText: 'Card Number',
                            hintText: 'Enter Card Number',
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 50,
                          width: 170,
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(150, 10, 10, 10),
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Add Card Number',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            child: Text(
              'Recieved Payments : ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: PaymentsRecieved(),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentsRecieved extends StatefulWidget {
  @override
  PaymentsRecievedPage createState() => PaymentsRecievedPage();
}

class PaymentsRecievedPage extends State<PaymentsRecieved> {
  List<Message> message = [
    Message(
        date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
        doctorName: 'Yasir'),
    Message(
      date: DateTime.now().subtract(Duration(days: 3, minutes: 4)),
      doctorName: 'Ali',
    ),
    Message(
      date: DateTime.now().subtract(Duration(days: 4, minutes: 1)),
      doctorName: 'Aysha',
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
    return Column(
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
                padding: const EdgeInsets.all(5),
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(5, 10, 40, 0),
                  child: Text(
                    'Payment Recieved From : ' + message.doctorName,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
