import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'UI/Home.dart';
import 'package:flutter/services.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() async {
  IO.Socket socket = IO.io('https://mix-chat-1.herokuapp.com');
// socket.on('connect',void Function(){ print("data")});
  socket.on('connect', (socket) => print(socket.id));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(vet_App());
}

class vet_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VetCare App',
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}
