import 'package:flutter/material.dart';
import 'UserData.dart';
import 'validMail.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationPage();
}

class _RegistrationPage extends State<Registration> {
  // UserData obj = UserData();
  TextEditingController nameCardController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController securityCodeController = TextEditingController();

  String validNameCard = '';
  String validCardNumber = '';
  String validSecurityCode = '';
  bool _errorDetector = false;
  String validExpiryDate = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: 300,
              child: Image.asset('images/mastercard.jpeg'),
            ),
            Container(
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
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                validNameCard,
                style: TextStyle(
                    fontSize: 10, color: Color.fromARGB(255, 144, 129, 128)),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Card Number',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    validCardNumber,
                    style: TextStyle(fontSize: 10, color: Colors.red),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: expiryDateController,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: 'Expiry Date',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    validExpiryDate,
                    style: TextStyle(fontSize: 10, color: Colors.red),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: securityCodeController,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: 'Security Code',
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                validSecurityCode,
                style: TextStyle(fontSize: 10, color: Colors.red),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: SizedBox(
                height: 60,
                width: 300,
                child: RaisedButton(
                  color: Colors.green,
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      validNameCard = '';
                      validCardNumber = '';
                      validExpiryDate = '';
                      validSecurityCode = '';
                      _errorDetector = false;
                    });

                    if (nameCardController.text == '') {
                      setState(() {
                        validNameCard = 'Required Name on Card ';
                        _errorDetector = true;
                      });
                    }
                    if (cardNumberController.text == '') {
                      setState(() {
                        validCardNumber = 'Required Card Number';
                        _errorDetector = true;
                      });
                    }
                    if (expiryDateController.text == '') {
                      setState(() {
                        validExpiryDate = 'Required Expiry Date';
                        _errorDetector = true;
                      });
                    }
                    if (securityCodeController.text == '') {
                      setState(() {
                        validSecurityCode = 'Required Security Code';
                        _errorDetector = true;
                      });
                    }
                    if (_errorDetector) {
                      print('');
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// Padding(
//         padding: const EdgeInsets.all(10),
//         child: ListView(
//           children: <Widget>[
//             Container(
//               padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//             ),
//             Container(
//               padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//               child: TextField(
//                 controller: nameCardController,
//                 decoration: new InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     borderSide: BorderSide(color: Colors.blue, width: 2.0),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     borderSide: BorderSide(color: Colors.black, width: 2.0),
//                   ),
//                   prefixIcon: Icon(Icons.person),
//                   hintText: 'Name on Card',
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
//               child: Text(
//                 validNameCard,
//                 style: TextStyle(fontSize: 10, color: Colors.red),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//               child: TextField(
//                 controller: cardNumberController,
//                 decoration: new InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     borderSide: BorderSide(color: Colors.blue, width: 2.0),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     borderSide: BorderSide(color: Colors.black, width: 2.0),
//                   ),
//                   prefixIcon: Icon(Icons.email),
//                   hintText: 'Card Number',
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
//               child: Text(
//                 validCardNumber,
//                 style: TextStyle(fontSize: 10, color: Colors.red),
//               ),
//             ),
//             Row(
//               children: [
//                 Column(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                       child: TextField(
//                         controller: securityCodeController,
//                         decoration: new InputDecoration(
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(20.0)),
//                             borderSide:
//                                 BorderSide(color: Colors.blue, width: 2.0),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(20.0)),
//                             borderSide:
//                                 BorderSide(color: Colors.black, width: 2.0),
//                           ),
//                           hintText: 'Security Code',
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
//                       child: Text(
//                         validSecurityCode,
//                         style: TextStyle(fontSize: 10, color: Colors.red),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                       child: TextField(
//                         controller: expiryDateController,
//                         decoration: new InputDecoration(
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(20.0)),
//                             borderSide:
//                                 BorderSide(color: Colors.blue, width: 2.0),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(20.0)),
//                             borderSide:
//                                 BorderSide(color: Colors.black, width: 2.0),
//                           ),
//                           hintText: 'Expiry Date',
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
//                       child: Text(
//                         validExpiryDate,
//                         style: TextStyle(fontSize: 10, color: Colors.red),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Container(
//               padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//               child: TextField(
//                 controller: postalCodeController,
//                 decoration: new InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     borderSide: BorderSide(color: Colors.blue, width: 2.0),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     borderSide: BorderSide(color: Colors.black, width: 2.0),
//                   ),
//                   hintText: 'Zip/Postal Code',
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
//               child: Text(
//                 validPostalCode,
//                 style: TextStyle(fontSize: 10, color: Colors.red),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
//               child: SizedBox(
//                 height: 60,
//                 width: 300,
//                 child: RaisedButton(
//                   color: Colors.green,
//                   child: const Text(
//                     'Register',
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                   onPressed: () {},
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50)),
//                 ),
//               ),
//             ),
//           ],
//         ),