import 'package:flutter/material.dart';

class Profiles extends StatefulWidget {
  @override
  State<Profiles> createState() => myProfile();
}

class myProfile extends State<Profiles> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _address = TextEditingController();
  String name = '';
  String email = '';
  String number = '';
  String address = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = "Sheraz Khalid";
    email = "sherazkhalid123@gmail.com";
    number = '+923008546933';
    address = 'Punjab, Gujrat, Marghazasr';
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
                      onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => editPhone(),
                      ),
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
                      onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => EditAddress(),
                      ),
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

  Widget editPhone() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: _number,
              decoration: InputDecoration(
                hintText: 'Enter Your Phone Number...',
                labelText: 'Phone Number',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
                number = _number.text;
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 15),
              alignment: Alignment.center,
              height: 50,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  Widget EditAddress() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: _address,
              decoration: InputDecoration(
                hintText: 'Enter Your Address...',
                labelText: 'Address',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
                address = _address.text;
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 15),
              alignment: Alignment.center,
              height: 50,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
