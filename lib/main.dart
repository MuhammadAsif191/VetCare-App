import 'package:flutter/material.dart';
import 'UI/Home.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
