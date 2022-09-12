import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class getLocationandPost extends StatefulWidget {
  getLocationandPost({
    Key? key,
    required this.imagePath,
    required this.productPrice,
    required this.productShipping,
    required this.productTitle,
    required this.shopName,
    required this.userName,
    required this.totalProduct,
  }) : super(key: key);
  final String totalProduct;
  final String userName;
  final String shopName;
  final String imagePath;
  final String productTitle;
  final String productPrice;
  final String productShipping;

  @override
  State<getLocationandPost> createState() => _getLocationandPostState();
}

class _getLocationandPostState extends State<getLocationandPost> {
  TextEditingController _locationController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();
  String validPhoneNo = '';
  String valid = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    valid = '';
    validPhoneNo = '';
  }

  void AddDatainFIrebase() async {
    FirebaseFirestore.instance.collection('ProductOrder').doc().set({
      "image": widget.imagePath,
      "price": widget.productPrice,
      "title": widget.productTitle,
      "shipping": widget.productShipping,
      "location": _locationController.text.trim(),
      "phoneNo": _phoneNoController.text.trim(),
      "userName": widget.userName,
      "totalProduct": widget.totalProduct,
    }).then((value) => Navigator.pop(context));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30.0),
              child: TextField(
                controller: _locationController,
                decoration: InputDecoration(
                  label: Text('Location'),
                  hintText: 'Enter Your Location ... ',
                ),
              ),
            ),
            Container(
              child: Text(
                '${valid}',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30.0),
              child: TextField(
                controller: _phoneNoController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  label: Text('Phone No'),
                  hintText: 'Enter Your Phone Number ... ',
                ),
              ),
            ),
            Container(
              child: Text(
                '${validPhoneNo}',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  valid = '';
                  validPhoneNo = '';
                });
                if (_phoneNoController.text.trim() == '') {
                  validPhoneNo = 'Plz Enter your phone Number ....';
                }
                if (_locationController.text.trim() == '') {
                  setState(() {
                    valid = 'Plz Enter your location ....';
                  });
                }
                if (_locationController.text.trim() != '' &&
                    _phoneNoController.text.trim() != '') {
                  AddDatainFIrebase();
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 60.0,
                width: 200.0,
                child: Text('Submit'),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
