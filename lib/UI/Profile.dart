import 'package:flutter/material.dart';

class Profiles extends StatefulWidget {
  @override
  State<Profiles> createState() => myProfile();
}

class myProfile extends State<Profiles> {
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  void initState() {
    super.initState();
    number = new TextEditingController(text: "Sheraz Khalid");
    email = new TextEditingController(text: "sherazkhalid123@gmail.com");
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/AppLogo.jpeg'),
                radius: 70.0,
              ),
              Text(
                'Sheraz Khalid',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              Text(
                'Profile',
                textAlign: TextAlign.center,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: number,
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
                    hintText: 'Mobile Number',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: email,
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
                    hintText: 'Email@gmail.com',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: SizedBox(
                  height: 60,
                  width: 300,
                  child: RaisedButton(
                    color: Colors.green[600],
                    onPressed: () {},
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
