import 'package:flutter/material.dart';

class Profiles extends StatefulWidget {
  @override
  State<Profiles> createState() => myProfile();
}

class myProfile extends State<Profiles> {
  String number = "Sheraz Khalid";
  String email = "sherazkhalid123@gmail.com";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/AppLogo.jpeg'),
                  radius: 80.0,
                ),
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
              Container(
                child: Text(
                  email.toString(),
                  style: TextStyle(fontFamily: 'Pacifico', fontSize: 18),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
