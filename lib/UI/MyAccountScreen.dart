import 'package:flutter/material.dart';
import 'MyAccountMessagesPersons.dart';
import 'MyAcountQAndA.dart';

class profile {
  profile({
    required this.img,
    required this.shopName,
  });
  final String img;
  final String shopName;
}

class SellerProducts {
  SellerProducts({
    required this.img,
    required this.Shipping,
    required this.price,
    required this.productName,
  });
  final String img;
  final String productName;
  final int price;
  final String Shipping;
}

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  profile profileData = profile(img: 'images/Doctor.jpeg', shopName: 'daraz');
  List<SellerProducts> myProductData = [
    SellerProducts(
      img: 'images/Doctor.jpeg',
      Shipping: 'Pakistan',
      price: 600,
      productName: 'Cough',
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      myProductData;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          )),
          context: context,
          builder: (context) => CreateProduct(),
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
                    builder: (context) => MyAcountQuestionAndAnswer(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessagesPersons(),
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text('Q/A'),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('My Orders'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image.asset(
              profileData.img,
            ),
            title: Text(
              profileData.shopName,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 20),
            alignment: Alignment.topLeft,
            child: Text(
              'My Prducts',
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
                  imageLoc: myProductData[index].img,
                  price: myProductData[index].price,
                  shipping: myProductData[index].Shipping,
                  title: myProductData[index].productName)),
            ),
          ),
        ],
      ),
    );
  }

  Widget CreateProduct() {
    TextEditingController productName = new TextEditingController();
    TextEditingController productPrice = new TextEditingController();
    TextEditingController productImg = new TextEditingController();
    TextEditingController productShipping = new TextEditingController();
    return ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          height: 100,
          alignment: Alignment.center,
          // color: Colors.red,
          child: Icon(
            Icons.add_a_photo_outlined,
            size: 100,
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
      ],
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
  }) : super(key: key);
  final String imageLoc;
  final String title;
  final int price;
  final String shipping;

  @override
  Widget build(BuildContext context) {
    const kDefaultPaddin = 20.0;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.grey[500],
        padding: EdgeInsets.all(0),
      ),
      onPressed: () {},
      child: Container(
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
                child: Image.asset(imageLoc),
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
                'Rs. ' + price.toString(),
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
