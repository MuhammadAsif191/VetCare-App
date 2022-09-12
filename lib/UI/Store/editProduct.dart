import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class editProduct extends StatefulWidget {
  const editProduct({
    Key? key,
    required this.productID,
  }) : super(key: key);
  final String productID;
  @override
  State<editProduct> createState() => _editProductState();
}

class _editProductState extends State<editProduct> {
  TextEditingController productName = new TextEditingController();
  TextEditingController productPrice = new TextEditingController();
  TextEditingController productImg = new TextEditingController();
  TextEditingController productShipping = new TextEditingController();
  File _image = new File('/dev/null');
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 25,
      );
      if (image == null) {
        print('failed');
        return;
      }

      setState(() {
        var imageTemporary = File(image.path);
        _image = imageTemporary;
        print('${image.path}');
      });
    }

    void AddDatainFIrebase(String val) async {
      // print("object");
      // print(val);
      // print(widget.DocName);
      FirebaseFirestore.instance
          .collection('StorProducts')
          .doc(widget.productID)
          .update({
        "image": val,
        "Price": productPrice.text,
        "P_Name": productName.text,
        "Country": productShipping.text
      }).then((value) => Navigator.pop(context));
    }

    Future uploadImageToFirebase() async {
      var _firebaseStorage = FirebaseStorage.instance;
      PickedFile image;
      //Check Permission
      //Select Image
      int date = DateTime.now().microsecondsSinceEpoch;
      var file = File(_image.path);

      if (_image != null) {
        //Upload to Firebase
        var snapshot =
            await _firebaseStorage.ref().child("${date}/").putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        print(downloadUrl);
        AddDatainFIrebase(downloadUrl);
      } else {
        print('No Image Path Received');
      }
    }

    bool isEmpty = false;
    String valid = '';
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print("object");

              setState(() {
                print('hello');
                getImage();
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              height: 100,
              alignment: Alignment.center,
              // color: Colors.red,
              child: _image.path != '/dev/null'
                  ? Image.file(
                      _image,
                      fit: BoxFit.cover,
                    )
                  : Icon(
                      Icons.add_a_photo_outlined,
                      size: 100,
                    ),
            ),
          ),
          Container(
            width: 200,
            alignment: Alignment.topCenter,
            child: TextField(
              controller: productName,
              decoration: InputDecoration(
                labelText: 'Product Name',
                hintText: 'Enter Product Name',
              ),
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            width: 200,
            alignment: Alignment.topCenter,
            child: TextField(
              keyboardType: TextInputType.number,
              controller: productPrice,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                labelText: 'Product Price',
                hintText: 'Enter Product Price',
              ),
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            width: 200,
            alignment: Alignment.topCenter,
            child: TextField(
              controller: productShipping,
              decoration: InputDecoration(
                labelText: 'Shipping Country',
                hintText: 'Enter Product Shipping Country',
              ),
            ),
          ),
          Container(
            child: Text(
              valid.toString(),
              style: TextStyle(color: Colors.red, fontSize: 15),
            ),
          ),
          GestureDetector(
            onTap: (() => {
                  // isEmpty = false,
                  if (_image.path != '/dev/null')
                    if (productName.text != '' && productName.text != ' ')
                      if (productPrice.text != '' && productPrice.text != ' ')
                        if (productShipping.text != '' &&
                            productShipping.text != ' ')
                          {
                            isEmpty = true,
                            uploadImageToFirebase(),
                            // Navigator.pop(context),
                          },
                  if (isEmpty)
                    {
                      setState(() {
                        valid = '* All Text flied Must be Filled';
                      })
                    }
                }),
            child: Container(
              height: 70,
              // width: 50,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 50, right: 50, top: 20),
              decoration: BoxDecoration(
                color: Colors.green[500],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
