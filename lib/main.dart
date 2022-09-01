import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'UI/Home.dart';
import 'package:flutter/services.dart';

void main() async {
// socket.on('connect',void Function(){ print("data")});

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
