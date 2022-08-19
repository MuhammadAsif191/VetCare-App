import 'package:flutter/material.dart';
import 'validMail.dart';

class StoreRegistration extends StatefulWidget {
  const StoreRegistration({Key? key}) : super(key: key);

  @override
  State<StoreRegistration> createState() => _StoreRegistrationPage();
}

class _StoreRegistrationPage extends State<StoreRegistration> {
  TextEditingController NameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  bool _isHiddenPass = true;
  bool _isHiddenConfirmPass = true;
  String NameValid = '';
  String ValidMailDum = '';
  String ValidMail = '';
  bool _errorDetector = false;
  String Password = '';
  String ConfirmPass = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Row(
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
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text('Registration'),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'SignUp for a new User',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: NameController,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  prefixIcon: Icon(Icons.person),
                  hintText: 'YOUR NAME',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                NameValid,
                style: TextStyle(fontSize: 10, color: Colors.red),
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
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Your Email',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                ValidMail,
                style: TextStyle(fontSize: 10, color: Colors.red),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: _isHiddenPass,
                controller: PasswordController,
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
                        _isHiddenPass = !_isHiddenPass;
                      });
                    },
                    child: Icon(_isHiddenPass
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'PASSWORD',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                Password,
                style: TextStyle(fontSize: 10, color: Colors.red),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: _isHiddenConfirmPass,
                controller: ConfirmPasswordController,
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
                        _isHiddenConfirmPass = !_isHiddenConfirmPass;
                      });
                    },
                    child: Icon(_isHiddenConfirmPass
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'CONFIRM PASSWORD',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                ConfirmPass,
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
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      NameValid = '';
                      ValidMail = '';
                      Password = '';
                      ConfirmPass = '';
                      _errorDetector = false;
                    });

                    ValidMailDum = validateEmail(EmailController.text);
                    if (EmailController.text != '') {
                      if (ValidMailDum != ValidMail) {
                        setState(() {
                          ValidMail = ValidMailDum;
                          _errorDetector = true;
                        });
                      }
                    }
                    if (EmailController.text == '') {
                      setState(() {
                        ValidMail = 'Required Email';
                        _errorDetector = true;
                      });
                    }
                    if (EmailController.text != '') {
                      if (ValidMailDum != ValidMail) {
                        setState(() {
                          ValidMail = ValidMailDum;
                          _errorDetector = true;
                        });
                      }
                    }
                    if (EmailController.text == '') {
                      setState(() {
                        ValidMail = 'Required Email';
                        _errorDetector = true;
                      });
                    }
                    if (PasswordController.text !=
                        ConfirmPasswordController.text) {
                      if (PasswordController.text != '' &&
                          ConfirmPasswordController != '') {
                        setState(() {
                          ConfirmPass = 'Password not match';
                          _errorDetector = true;
                        });
                      }
                    }
                    if (NameController.text == '') {
                      setState(() {
                        NameValid = 'Required Name';
                        _errorDetector = true;
                      });
                    }
                    if (ConfirmPasswordController.text == '') {
                      setState(() {
                        ConfirmPass = 'Required Confirmation Password';
                        _errorDetector = true;
                      });
                    }
                    if (PasswordController.text == '') {
                      setState(() {
                        Password = 'Required Password';
                        _errorDetector = true;
                      });
                    }
                    if (!_errorDetector) {
                      // if (obj.signUp()) {}
                      Navigator.pop(context);
                    } else
                      print('Not Found');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                const Text('By registering you to the'),
                TextButton(
                  child: const Text(
                    'terms',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {},
                ),
                const Text('of use'),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
