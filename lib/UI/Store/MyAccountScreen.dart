import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'Orders.dart';
import 'editProduct.dart';

class SellerProducts {
  SellerProducts({
    required this.img,
    required this.Shipping,
    required this.price,
    required this.productName,
    required this.productID,
  });
  final String productID;
  final String img;
  final String productName;
  final String price;
  final String Shipping;
}

class MyAccountMainScreen extends StatefulWidget {
  const MyAccountMainScreen({Key? key, required this.shopName})
      : super(key: key);
  final String shopName;
  @override
  State<MyAccountMainScreen> createState() => _MyAccountMainScreenState();
}

class _MyAccountMainScreenState extends State<MyAccountMainScreen> {
  List<SellerProducts> myProductData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Hello Asif');
    setState(() {
      myProductData;
    });
    getValue();
  }

  Future<void> getValue() async {
    var app = FirebaseFirestore.instance.collection('StorProducts').get();

    app.then((QuerySnapshot querySnapshot) => {
          myProductData = [],
          querySnapshot.docs.forEach((element) {
            print(element['P_Name']);
            setState(() {
              myProductData.add(SellerProducts(
                productID: element.id,
                img: element['image'],
                Shipping: element['Country'],
                price: element['Price'],
                productName: element['P_Name'],
              ));
            });
          })
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateProduct()),
        ),
        child: Container(
          // alignment: ,
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.green[500],
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Text('My Account'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderProductScreen(),
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text('My Orders'),
              ),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => getValue(),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Shop Name :',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topRight,
                      child: Text(
                        widget.shopName,
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              alignment: Alignment.topLeft,
              child: Text(
                'Prducts',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: myProductData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: ((context, index) => MyProducts(
                      productID: myProductData[index].productID,
                      imageLoc: myProductData[index].img,
                      price: myProductData[index].price,
                      shipping: myProductData[index].Shipping,
                      title: myProductData[index].productName,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateProduct extends StatefulWidget {
  const CreateProduct({Key? key}) : super(key: key);
  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
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
      FirebaseFirestore.instance.collection('StorProducts').doc().set({
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
              controller: productPrice,
              keyboardType: TextInputType.number,
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
                            Navigator.pop(context),
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

class MyProducts extends StatelessWidget {
  MyProducts({
    Key? key,
    required this.imageLoc,
    required this.price,
    required this.shipping,
    required this.title,
    required this.productID,
  }) : super(key: key);
  final String productID;
  final String imageLoc;
  final String title;
  final String price;
  final String shipping;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.grey[500],
        padding: EdgeInsets.all(0),
      ),
      onLongPress: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                title: new Text("Vet Care App"),
                content: Wrap(
                  children: [
                    Text("are you sure you delete "),
                    Text(
                      '${title}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(' ?'),
                  ],
                ),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  new InkWell(
                    child: new Text("Cencel"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  new InkWell(
                    child: new Text("Ok"),
                    onTap: () {
                      FirebaseFirestore.instance
                          .collection('StorProducts')
                          .doc(productID)
                          .delete()
                        ..then((value) => Navigator.pop(context));
                    },
                  ),
                ],
              );
            });
      },
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => editProduct(productID: productID),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                // padding: EdgeInsets.all(kDefaultPaddin / 4),
                // height: 180,
                // width: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.network(imageLoc),
              ),
            ),
            Text(
              title,
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Rs. ' + price,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(shipping)
          ],
        ),
      ),
    );
  }
}
