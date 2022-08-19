import 'package:flutter/material.dart';

import 'StoreLogin.dart';
import 'StoreRegistration.dart';

class StoreMain extends StatefulWidget {
  @override
  StoreMainpage createState() => StoreMainpage();
}

class StoreMainpage extends State<StoreMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        centerTitle: true,
        title: Text(
          'Login or registration Store account',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            flex: 3,
            child: PageView(
              children: <Widget>[
                Container(
                  child: _Splash(
                    text: 'All the best and nearest hospitals',
                    image: 'images/Hospital.jpeg',
                  ),
                ),
                Container(
                  child: _Splash(
                    text: 'Honest reviews about your doctor.',
                    image: 'images/Doctor.jpeg',
                  ),
                ),
                Container(
                  child: _Splash(
                    text: 'Share your impressions of visting a hospital.',
                    image: 'images/Share.jpeg',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: SizedBox(
                    height: 60,
                    width: 250,
                    child: RaisedButton(
                      color: Colors.green[600],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StoreRegistration()),
                        );
                      },
                      child: Text(
                        "Registration",
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StoreLogin()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Splash extends StatelessWidget {
  const _Splash({
    this.text = '',
    this.image = '',
  });

  final String text, image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Image.asset(
            image,
            height: 300,
            width: 300,
          ),
        ),
      ],
    );
  }
}
