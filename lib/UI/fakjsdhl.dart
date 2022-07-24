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
              child: const Text('Login'),
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
                  hintText: 'Your Email',
                ),
              ),
            ),
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
              height: 50,
              margin: EdgeInsets.fromLTRB(40, 8, 40, 8),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserMenu()),
                      );
                    } else {
                      setState(() {
                        _signin = 'Your email or password wrong!';
                      });
                    }
                  }
                },
              ),
            ),
            Row(
              children: <Widget>[
                const Text('I forget'),
                TextButton(
                  child: const Text(
                    'password',
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
}
