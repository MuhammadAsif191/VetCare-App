import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  UserProfile({required this.userName, required this.email});
  final String userName;
  final String email;
  @override
  State<UserProfile> createState() => UserProfilePAge();
}

class UserProfilePAge extends State<UserProfile> {
  // String name = "Sheraz Khalid";
  // String email = "sherazkhalid123@gmail.com";
  String number = '+923008546933';
  String address = 'Punjab, Gujrat, Marghazasr';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.email;
    number;
    address;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Text('User Profile'),
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
              widget.userName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Pacifico',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text('Email : '),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    // margin: EdgeInsets.only(right: 15),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        widget.email,
                        style: TextStyle(fontFamily: 'Pacifico', fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('Phone : ')),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(left: 13),
                      child: Text(
                        number,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(left: 18),
                      child: Text('Address : ')),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        address,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
