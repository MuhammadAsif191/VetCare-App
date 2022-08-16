import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'UI/Home.dart';
import 'package:flutter/services.dart';

void main() async {
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
        home: Home());
  }
}

// Future createUser() async {
//   final docuser = FirebaseFirestore.instance.collection('user').doc('my-key');
//   final json = {'name': 'sheraz', 'age': '21', 'birthday': '18'};

//   await docuser.set(json);
// }




// Container(
//             child: RaisedButton(
//           onPressed: () async {
//             createUser();
//             // sing

//             // Firebassen((value) => print(value));
//             // try {
//             // FirebaseAuth.instance.createUserWithEmailAndPassword(
//             //     email: "Asiflogin@gmail.com".trim(),
//             //     password: "Huda i love you".trim());
//             // FirebaseFirestore.instance
//             //     .collection("sheraz")
//             //     .doc("Key")
//             //     .set({"name": "huda"});
//             // final Aopp = FirebaseFirestore.instance
//             //     .collection("Sheraz")
//             //     .doc("Key123456");
//             // await Aopp.set({'name': "Sheraz", 'love': "Koi b Nahi"});

//             // .set({});
//             // } on FirebaseAuthException catch (err) {
//             //   print(err);
//             // }
//           },
//           child: Text("Press"),
//         ))
//         // home: Scaffold(
//         //   body: Home(),
//         // ),