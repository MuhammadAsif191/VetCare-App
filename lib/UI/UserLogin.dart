import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'UserData.dart';
import 'RecoverPass.dart';
import 'validMail.dart';
import 'MainMenu.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginPage();
}

class _LoginPage extends State<Login> {
  UserData obj = UserData();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isHidden = true;
  String validDum = '';
  String valid = '';
  String already = '';
  bool _errorDetector = false;
  String password = '';
  String _signin = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
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
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text('Login to user acount'),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Welcome back friend!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                already,
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                _signin,
                style: TextStyle(fontSize: 10, color: Colors.red),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: nameController,
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
                  hintText: 'Your Email',
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  valid,
                  style: TextStyle(fontSize: 10, color: Colors.red),
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: _isHidden,
                controller: passwordController,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isHidden = !_isHidden;
                      });
                    },
                    child: Icon(
                        _isHidden ? Icons.visibility_off : Icons.visibility),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'PASSWORD',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                password,
                style: TextStyle(fontSize: 10, color: Colors.red),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: SizedBox(
                height: 60,
                width: 300,
                child: RaisedButton(
                  color: Colors.green[600],
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      valid = '';
                      password = '';
                      already = '';
                      _signin = '';
                      _errorDetector = false;
                    });
                    validDum = validateEmail(nameController.text);
                    if (validDum != valid) {
                      setState(() {
                        valid = validDum;
                        _errorDetector = true;
                      });
                    }
                    if (nameController.text == '') {
                      setState(() {
                        valid = 'Required email';
                        _errorDetector = true;
                      });
                    }
                    if (passwordController.text == '') {
                      setState(() {
                        password = 'Required password';
                        _errorDetector = true;
                      });
                    }
                    if (!_errorDetector) {
                      if (obj.signin(
                          nameController.text, passwordController.text)) {
                        GetData();
                      } else {
                        setState(() {
                          _signin = 'Your email or password wrong!';
                        });
                      }
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                const Text('I forget'),
                TextButton(
                  child: const Text(
                    'password',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => forgetPass(),
                      ),
                    );
                    // Navigator.pop(context);
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }

  Future CheckStatus() async {
    final app = await FirebaseFirestore.instance.collection('users');
    app.get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((element) {
            if (element['email'] == nameController.text) {
              if (element["status"] == 'Unblock') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserMenu()),
                );
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // return object of type Dialog
                      return AlertDialog(
                        title: new Text("Vet Care App"),
                        content: new Text(
                            "PLease try to connect support of Vet Care App"),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          new FlatButton(
                            child: new Text("Close"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              }
            }
          })
        });
  }

  Future GetData() async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: nameController.text, password: passwordController.text)
        .then(((value) => {CheckStatus()}))
        .catchError((onError) => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text("Vet Care App"),
                      content: new Text("Email or password goes wrong"),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  })
            });
  }
}
