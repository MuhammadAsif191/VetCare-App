import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// import 'AddLocationForProduct.dart';
class OrderProductData {
  OrderProductData({
    required this.imagePath,
    required this.productPrice,
    required this.productShipping,
    required this.productTitle,
    required this.userName,
    required this.totalProduct,
    required this.userLocation,
    required this.userPhoneNo,
  });
  final String userPhoneNo;
  final String userLocation;
  final String totalProduct;
  final String userName;
  final String imagePath;
  final String productTitle;
  final String productPrice;
  final String productShipping;
}

class OrderProductScreen extends StatefulWidget {
  OrderProductScreen({Key? key}) : super(key: key);
  @override
  State<OrderProductScreen> createState() => _OrderProductScreenState();
}

class _OrderProductScreenState extends State<OrderProductScreen> {
  List<OrderProductData> allData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var app = FirebaseFirestore.instance.collection('ProductOrder').get();

    app.then((QuerySnapshot querySnapshot) => {
          setState(() {
            allData = [];
          }),

          querySnapshot.docs.forEach((element) {
            //  element
            print(element);
            setState(() {
              allData.add(
                OrderProductData(
                  userPhoneNo: element['phoneNo'],
                  imagePath: element['image'],
                  productPrice: element['price'],
                  productShipping: element['shipping'],
                  productTitle: element['title'],
                  userName: element['userName'],
                  totalProduct: element['totalProduct'],
                  userLocation: element['location'],
                ),
              );
            });
          })
          // GetData();
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Your Orders'),
      ),
      body: Container(
        child: allData.length > 0
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: allData.length,
                itemBuilder: (context, index) {
                  return OrderScreen(
                    imagePath: allData[index].imagePath,
                    productPrice: allData[index].productPrice,
                    productShipping: allData[index].productShipping,
                    productTitle: allData[index].productTitle,
                    userName: allData[index].userName,
                    totalProduct: allData[index].totalProduct,
                    userLocation: allData[index].userLocation,
                    userPhoneNo: allData[index].userPhoneNo,
                  );
                },
              )
            : Container(),
      ),
    );
  }
}

class OrderScreen extends StatelessWidget {
  OrderScreen({
    required this.imagePath,
    required this.productPrice,
    required this.productShipping,
    required this.productTitle,
    required this.userName,
    required this.totalProduct,
    required this.userLocation,
    required this.userPhoneNo,
  });
  final String userPhoneNo;
  final String userLocation;
  final String totalProduct;
  final String userName;
  final String imagePath;
  final String productTitle;
  final String productPrice;
  final String productShipping;
  // @override

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.only(top: 10, left: 10),
          child: Row(
            children: <Widget>[
              Text('User Name'),
              SizedBox(
                width: 100,
              ),
              Expanded(
                child: Text(userName),
              ),
            ],
          ),
        ),
        Divider(
          height: 20,
          thickness: 1,
          endIndent: 15,
          indent: 15,
        ),
        Container(
          padding: EdgeInsets.only(
            left: 10,
            top: 20,
          ),
          height: 120,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Image.network(imagePath),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(productTitle),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Rs. ' + productPrice,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(right: 10),
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    'Qty: ' + totalProduct,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          endIndent: 15,
          indent: 15,
        ),
        Container(
          padding: EdgeInsets.only(top: 3, right: 10),
          alignment: Alignment.topRight,
          child: Text.rich(
            TextSpan(
              children: <InlineSpan>[
                TextSpan(
                  text: totalProduct.toString(),
                ),
                TextSpan(
                  text: ' Total Item(s) : ',
                ),
                TextSpan(
                  text: 'Rs. ' + productPrice,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.green[500],
          child: Row(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  ' User Location : ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Text('${userLocation}'),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.green[500],
          child: Row(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  ' User Contact No : ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Text('${userPhoneNo}'),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 4,
          color: Colors.black87,
          endIndent: 30,
          indent: 30,
        ),
      ],
    );
  }
}
