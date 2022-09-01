import 'package:flutter/material.dart';

class BuyNowScreen extends StatefulWidget {
  BuyNowScreen({
    Key? key,
    required this.imagePath,
    required this.productPrice,
    required this.productShipping,
    required this.productTitle,
    required this.shopName,
  }) : super(key: key);
  final String shopName;
  final String imagePath;
  final String productTitle;
  final String productPrice;
  final String productShipping;

  @override
  State<BuyNowScreen> createState() => _BuyNowScreenState();
}

class _BuyNowScreenState extends State<BuyNowScreen> {
  int totalProduct = 1;
  int totalPriceBuy = 50;
  void initState() {
    super.initState();
    setState(() {
      totalPriceBuy = int.parse(widget.productPrice);
      totalProduct = 1;
      totalPriceBuy = 0;
    });
  }

  Widget build(BuildContext context) {
    @override
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10),
              height: 50,
              child: Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Total::',
                    ),
                    TextSpan(
                      text: 'Rs. ' + totalPriceBuy.toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                margin: EdgeInsets.only(right: 10, bottom: 10),
                color: Colors.green[500],
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 50,
                child: Text('Proceed to Pay')),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Checkout'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: <Widget>[
                Text('Package 1 of 1'),
                SizedBox(
                  width: 100,
                ),
                Expanded(
                  child: Text('Shipped by ' + widget.shopName),
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
                  child: Image.network(widget.imagePath),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(widget.productTitle),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Rs. ' + totalPriceBuy.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(right: 10),
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      'Qty: ' + totalProduct.toString(),
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
                    text: ' Item(s). Subtotal: ',
                  ),
                  TextSpan(
                    text: 'Rs. ' + totalPriceBuy.toString(),
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1,
            endIndent: 15,
            indent: 15,
          ),
          Container(
            padding: EdgeInsets.only(top: 3, right: 10, left: 10),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                      'Items Total(' + totalProduct.toString() + ' Items)'),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Rs. ' + totalPriceBuy.toString(),
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
            padding: EdgeInsets.only(top: 3, right: 10, left: 10),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('Product Quantity'),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        totalProduct += 1;
                        totalPriceBuy += int.parse(widget.productPrice);
                      });
                    },
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Text(totalProduct.toString()),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (totalProduct != 0) {
                          totalProduct -= 1;
                          totalPriceBuy -= int.parse(widget.productPrice);
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.minimize),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
