import 'package:flutter/material.dart';
import 'ProductDetail.dart';
import 'StoreData.dart';

List<VetStoredata> allProducts = [
  VetStoredata(
      imageLocation: 'images/Doctor.jpeg',
      productDescription: "Nice One",
      productName: 'head ech',
      productPrice: 50,
      productRating: 2,
      productShipping: 'Pakistan'),
  VetStoredata(
      imageLocation: 'images/Doctor.jpeg',
      productDescription: "Nice One",
      productName: 'head ech',
      productPrice: 50,
      productRating: 2,
      productShipping: 'Pakistan'),
  VetStoredata(
      imageLocation: 'images/Doctor.jpeg',
      productDescription: "Nice One",
      productName: 'head ech',
      productPrice: 50,
      productRating: 2,
      productShipping: 'Pakistan'),
  VetStoredata(
      imageLocation: 'images/Doctor.jpeg',
      productDescription: "Nice One",
      productName: 'head ech',
      productPrice: 50,
      productRating: 2,
      productShipping: 'Pakistan'),
  VetStoredata(
      imageLocation: 'images/Doctor.jpeg',
      productDescription: "Nice One",
      productName: 'head ech',
      productPrice: 50,
      productRating: 2,
      productShipping: 'Pakistan'),
  VetStoredata(
      imageLocation: 'images/Doctor.jpeg',
      productDescription: "Nice One",
      productName: 'head ech',
      productPrice: 50,
      productRating: 2,
      productShipping: 'Pakistan'),
];

class ShopScreenOfProduct extends StatefulWidget {
  const ShopScreenOfProduct({
    Key? key,
    required this.shopName,
    required this.name,
  }) : super(key: key);
  final String shopName;
  final String name;
  @override
  State<ShopScreenOfProduct> createState() => _ShopScreenOfProductState();
}

class _ShopScreenOfProductState extends State<ShopScreenOfProduct> {
  bool status = false;
  final String SellerRating = '90%';
  String followUnfollow = 'Follow';
  @override
  void initState() {
    super.initState();
    setState(() {
      followUnfollow = 'Follow';
      status = !status;
    });
  }

  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text(widget.shopName),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.green[300],
            child: ListTile(
              onTap: () {
                print('ListTile');
              },
              leading: CircleAvatar(
                child: Image.asset('images/Doctor.jpeg'),
              ),
              title: Text(widget.name),
              subtitle: Text(SellerRating + ' Positive Seller Ratings'),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    status = !status;
                    status == false
                        ? followUnfollow = 'Follow'
                        : followUnfollow = 'Following';
                  });
                  print(followUnfollow);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: 80,
                  color: Colors.green,
                  child: Text(followUnfollow),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 20),
            alignment: Alignment.topLeft,
            child: Text(
              'All Prducts',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: allProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: 0.75,
              ),
              itemBuilder: ((context, index) => ProductContainer(
                    imageLoc: allProducts[index].imageLocation,
                    description: allProducts[index].productDescription,
                    price: allProducts[index].productPrice,
                    rating: allProducts[index].productRating,
                    shipping: allProducts[index].productShipping,
                    title: allProducts[index].productName,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductContainer extends StatelessWidget {
  ProductContainer({
    Key? key,
    required this.imageLoc,
    required this.description,
    required this.price,
    required this.rating,
    required this.shipping,
    required this.title,
  }) : super(key: key);
  final String imageLoc;
  final String title;
  final int price;
  final String shipping;
  final int rating;
  final String description;

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
              Shipping: shipping,
              imagePath: imageLoc,
              productPrice: price,
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
