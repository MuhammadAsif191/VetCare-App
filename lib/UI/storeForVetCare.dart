import 'package:flutter/material.dart';
import 'ProductDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SellerProducts {
  SellerProducts({
    required this.img,
    required this.Shipping,
    required this.price,
    required this.productName,
  });
  final String img;
  final String productName;
  final String price;
  final String Shipping;
}

class StoreMainScreen extends StatefulWidget {
  const StoreMainScreen({Key? key}) : super(key: key);

  @override
  State<StoreMainScreen> createState() => StoreMainScreenState();
}

class StoreMainScreenState extends State<StoreMainScreen> {
  List<SellerProducts> Cate1 = [];

  @override
  Future<void> getValue() async {
    var app = FirebaseFirestore.instance.collection('StorProducts').get();

    app.then((QuerySnapshot querySnapshot) => {
          Cate1 = [],
          querySnapshot.docs.forEach((element) {
            print(element['P_Name']);
            setState(() {
              Cate1.add(SellerProducts(
                img: element['image'],
                Shipping: element['Country'],
                price: element['Price'],
                productName: element['P_Name'],
              ));
            });
          })
        });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text(
          "Vet Medical Store",
          style: TextStyle(fontSize: 15),
        ),
        // actions: [
        // PopupMenuButton(
        //   onSelected: (value) {
        //     if (value == 1) {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => MyAccountScreen(),
        //         ),
        //       );
        //     }
        //   },
        //   itemBuilder: (context) => [
        //     PopupMenuItem(
        //       value: 1,
        //       child: Text('My Account'),
        //     ),
        //   ],
        // ),
        // ],
        // bottom: TabBar(
        //   controller: tabController,
        //   indicatorColor: Colors.white,
        //   tabs: [
        //     Tab(
        //       text: "Vaccines",
        //     ),
        //     Tab(
        //       text: "Pharmaceuticals",
        //     ),
        //     Tab(
        //       text: "Tick Medicinies",
        //     ),
        //     Tab(
        //       text: "Flea",
        //     ),
        //   ],
        // ),
      ),
      body: GridView.builder(
        itemCount: Cate1.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          childAspectRatio: 0.75,
        ),
        itemBuilder: ((context, index) => ProductContainer(
              imageLoc: Cate1[index].img,
              price: Cate1[index].price,
              shipping: Cate1[index].Shipping,
              title: Cate1[index].productName,
            )),
      ),
    );
  }
}

class ProductContainer extends StatelessWidget {
  ProductContainer({
    Key? key,
    required this.imageLoc,
    required this.price,
    required this.shipping,
    required this.title,
  }) : super(key: key);
  String imageLoc;
  String title;
  String price;
  String shipping;

  @override
  Widget build(BuildContext context) {
    const kDefaultPaddin = 20.0;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.grey[500],
        padding: EdgeInsets.all(0),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              imagePath: imageLoc,
              productPrice: int.parse(price),
              Shipping: shipping,
              productTitle: title,
            ),
          ),
        );
      },
      child: Container(
        // height: 300,
        // width: 300,
        padding: EdgeInsets.all(kDefaultPaddin / 4),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(kDefaultPaddin / 4),
                // height: 180,
                // width: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.network(imageLoc),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                kDefaultPaddin / 4,
                kDefaultPaddin / 4,
                0,
                0,
              ),
              child: Text(
                title,
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                kDefaultPaddin / 5,
                kDefaultPaddin / 5,
                0,
                0,
              ),
              child: Text(
                'Rs. ' + price,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(
                  kDefaultPaddin / 5,
                  kDefaultPaddin / 5,
                  0,
                  0,
                ),
                child: Text(shipping))
          ],
        ),
      ),
    );
  }
}
