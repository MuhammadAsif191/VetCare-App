import 'package:flutter/material.dart';
import 'package:vet_care_app/UI/storeForVetCare.dart';
import 'AdminLogin.dart';
import 'StoreLoginAndRegistration.dart';
import 'UseMain.dart';
import 'DocterMan.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  Homepage createState() => Homepage();
}

class Homepage extends State<Home> {
  IO.Socket socket =
      IO.io('https://mix-chat-1.herokuapp.com/', <String, dynamic>{
    "transports": ["websocket"],
    "autoconnect": false,
  });
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("object");
    Connect();
    // socket.onconnect((id) => print(id));
    // socket.onconnect((id) => print("object"));
  }

  void Connect() {
    socket.connect();
    socket.onConnect((data) => print(socket.id));
    socket.emit("register", "asif12@gmail.com");
    socket.onConnect((data) {
      print(socket.id);
      socket.on('private_chat', (msg) {
        // console.log(msg);
        print(msg);
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: SizedBox(
                  height: 200,
                  child: Image.asset("images/vetcarelogo.png"),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Welcome back friend!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: SizedBox(
                        height: 60,
                        width: 300,
                        child: RaisedButton(
                          color: Colors.green[600],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text(
                            "Admin",
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
                      height: 10.0,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: SizedBox(
                        height: 60,
                        width: 300,
                        child: RaisedButton(
                          color: Colors.green[600],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoctorMain()),
                            );
                          },
                          child: Text(
                            "Doctor",
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
                      height: 10.0,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                        // color: Colors.green[800],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SizedBox(
                        height: 60,
                        width: 300,
                        child: RaisedButton(
                          color: Colors.green[600],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserMain()),
                            );
                          },
                          child: Text(
                            "User",
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
                      height: 10.0,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                        // color: Colors.green[800],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SizedBox(
                        height: 60,
                        width: 300,
                        child: RaisedButton(
                          color: Colors.green[600],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StoreMain()),
                            );
                          },
                          child: Text(
                            "Store",
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
            ],
          ),
        ),
      ),
    );
  }
}
