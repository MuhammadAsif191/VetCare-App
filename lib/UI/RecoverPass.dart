import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'validMail.dart';
import 'UserData.dart';

int? EMAIL;

class forgetPass extends StatefulWidget {
  @override
  State<forgetPass> createState() => _forgetPassPage();
}

class _forgetPassPage extends State<forgetPass> {
  TextEditingController EmailController = TextEditingController();
  UserData Objforget = UserData();
  String validmail = '';
  bool flagMail = false;
  @override
  void dispose() {
    EmailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: EmailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: <Widget>[
          Container(
              child: Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                child: FlatButton(
                    child: Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ],
          )),
          Container(
            margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
            child: Text(
              'Password recovery',
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: EmailController,
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                hintText: 'Your Email',
              ),
            ),
          ),
          Container(
            child: Row(children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  validmail,
                  style: TextStyle(fontSize: 10, color: Colors.red),
                ),
              ),
            ]),
          ),
          Container(
            child: Row(children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(20, 1, 1, 1),
                child: Text(
                  'Enter the email address in which the account has registered.',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 60,
            width: 300,
            child: RaisedButton(
              color: Colors.green[600],
              child: const Text('RECOVER THE PASSWORD'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                setState(() {
                  flagMail = false;
                  validmail = '';
                });
                if (EmailController.text == '') {
                  validmail = 'Email required';
                  flagMail = true;
                }
                if (validateEmail(EmailController.text) != '') {
                  validmail = 'Enter valid email';
                  flagMail = true;
                }
                if (!flagMail) {}
              },
            ),
          ),
        ]),
      ),
    );
  }
}
