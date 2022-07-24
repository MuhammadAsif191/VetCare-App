import 'package:flutter/material.dart';

int? EMAIL;

class userpayments extends StatefulWidget {
  @override
  State<userpayments> createState() => _paymentsPage();
}

class _paymentsPage extends State<userpayments> {
  TextEditingController nameCardController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController securityCodeController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();

  String validNameCard = '';
  String validCardNumber = '';
  String validSecurityCode = '';
  String validExpiryDate = '';
  String validPostalCode = '';
  bool flagCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        centerTitle: true,
        title: Text("Make Payment"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(7),
              height: 400,
              width: 500,
              child: Image.asset('images/mastercard.jpeg'),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: nameCardController,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  hintText: 'Name on Card',
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              validNameCard,
              style: TextStyle(fontSize: 10, color: Colors.red),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: cardNumberController,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  hintText: 'Card Number',
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              validCardNumber,
              style: TextStyle(fontSize: 10, color: Colors.red),
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Column(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: expiryDateController,
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        hintText: 'Expiry date',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      validExpiryDate,
                      style: TextStyle(fontSize: 10, color: Colors.red),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: TextField(
                      controller: securityCodeController,
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        hintText: 'security code',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      validSecurityCode,
                      style: TextStyle(fontSize: 10, color: Colors.red),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: postalCodeController,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  hintText: 'Zip/Postal code',
                ),
              ),
            ),
          ),
          Text(
            validExpiryDate,
            style: TextStyle(fontSize: 10, color: Colors.red),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
              child: SizedBox(
                height: 60,
                width: 300,
                child: RaisedButton(
                  color: Colors.green[600],
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
