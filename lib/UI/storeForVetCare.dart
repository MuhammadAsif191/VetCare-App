import 'package:flutter/material.dart';
import 'ProductDetail.dart';
import 'MyAccountScreen.dart';
import 'StoreData.dart';

List<VetStoredata> Cate1 = [
  VetStoredata(
    imageLocation: 'images/Doctor.jpeg',
    productDescription: "Nice One",
    productName: 'head ech',
    productPrice: 60,
    productRating: 2,
    productShipping: 'Pakistan',
  ),
  VetStoredata(
    imageLocation: 'images/Doctor.jpeg',
    productDescription: "Nice One",
    productName: 'head ech',
    productPrice: 40,
    productRating: 2,
    productShipping: 'Pakistan',
  ),
  VetStoredata(
    imageLocation: 'images/Doctor.jpeg',
    productDescription: "Nice One",
    productName: 'head ech',
    productPrice: 50,
    productRating: 2,
    productShipping: 'Pakistan',
  ),
];
List<VetStoredata> Cate2 = [
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
List<VetStoredata> Cate3 = [
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
List<VetStoredata> Cate4 = [
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
  VetStoredata(
      imageLocation: 'images/Doctor.jpeg',
      productDescription: "Nice One",
      productName: 'head ech',
      productPrice: 50,
      productRating: 2,
      productShipping: 'Pakistan'),
];

class StoreMainScreen extends StatefulWidget {
  const StoreMainScreen({Key? key}) : super(key: key);

  @override
  State<StoreMainScreen> createState() => StoreMainScreenState();
}

class StoreMainScreenState extends State<StoreMainScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  int selectedTabIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: 4, vsync: this, initialIndex: selectedTabIndex);
    tabController.addListener(() {
      setState(() {
        selectedTabIndex = tabController.index;
      });
    });
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
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: "Vaccines",
            ),
            Tab(
              text: "Pharmaceuticals",
            ),
            Tab(
              text: "Tick Medicinies",
            ),
            Tab(
              text: "Flea",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          GridView.builder(
            itemCount: Cate1.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 0.75,
            ),
            itemBuilder: ((context, index) => ProductContainer(
                  imageLoc: Cate1[index].imageLocation,
                  description: Cate1[index].productDescription,
                  price: Cate1[index].productPrice,
                  rating: Cate1[index].productRating,
                  shipping: Cate1[index].productShipping,
                  title: Cate1[index].productName,
                )),
          ),
          GridView.builder(
            itemCount: Cate2.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 0.75,
            ),
            itemBuilder: ((context, index) => ProductContainer(
                  imageLoc: Cate2[index].imageLocation,
                  description: Cate2[index].productDescription,
                  price: Cate2[index].productPrice,
                  rating: Cate2[index].productRating,
                  shipping: Cate2[index].productShipping,
                  title: Cate2[index].productName,
                )),
          ),
          GridView.builder(
            itemCount: Cate3.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 0.75,
            ),
            itemBuilder: ((context, index) => ProductContainer(
                  imageLoc: Cate3[index].imageLocation,
                  description: Cate3[index].productDescription,
                  price: Cate3[index].productPrice,
                  rating: Cate3[index].productRating,
                  shipping: Cate3[index].productShipping,
                  title: Cate3[index].productName,
                )),
          ),
          GridView.builder(
            itemCount: Cate4.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 0.75,
            ),
            itemBuilder: ((context, index) => ProductContainer(
                  imageLoc: Cate4[index].imageLocation,
                  description: Cate4[index].productDescription,
                  price: Cate4[index].productPrice,
                  rating: Cate4[index].productRating,
                  shipping: Cate4[index].productShipping,
                  title: Cate4[index].productName,
                )),
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
  String imageLoc;
  String title;
  int price;
  String shipping;
  int rating;
  String description;

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
              productPrice: price,
              productDesc: description,
              productRating: rating,
              productShipping: shipping,
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
