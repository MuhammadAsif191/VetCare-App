import 'package:flutter/material.dart';

class Simple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
    body: Center(
      child: Text(
        'Login SuccessFul...',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    ),
    );
  }
}
