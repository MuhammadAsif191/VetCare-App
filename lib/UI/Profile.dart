import 'package:flutter/material.dart';

class Profiles extends StatefulWidget {
  @override
  State<Profiles> createState() => myProfile();
}

class myProfile extends State<Profiles> {
  String name = "Sheraz Khalid";
  String email = "sherazkhalid123@gmail.com";
  String number = '+923008546933';
  String address = 'Punjab, Gujrat, Marghazasr';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name;
    email;
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
              name,
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
                        email.toString(),
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
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Text('Phone : ')),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 13),
                    child: Text(
                      number,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        alignment: Alignment.topRight,
                        child: Icon(Icons.edit),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(left: 18),
                        child: Text('Address : ')),
                  ),
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
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        alignment: Alignment.topRight,
                        child: Icon(Icons.edit),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
