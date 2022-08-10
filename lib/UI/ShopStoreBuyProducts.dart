import 'package:flutter/material.dart';

class ShopStoreProductsAreBuy {
  ShopStoreProductsAreBuy({
    required this.imagePath,
    required this.productPrice,
    required this.productTitle,
    required this.items,
  });
  final String imagePath;
  final String productTitle;
  final int productPrice;
  final int items;
}

class DisplayStoredBuyProducts extends StatefulWidget {
  const DisplayStoredBuyProducts({Key? key}) : super(key: key);

  @override
  State<DisplayStoredBuyProducts> createState() =>
      _DisplayStoredBuyProductsState();
}

class _DisplayStoredBuyProductsState extends State<DisplayStoredBuyProducts> {
  List<ShopStoreProductsAreBuy> data = [
    ShopStoreProductsAreBuy(
      imagePath: 'images/Doctor.jpeg',
      productPrice: 50,
      productTitle: 'cough',
      items: 4,
    ),
    ShopStoreProductsAreBuy(
      imagePath: 'images/Doctor.jpeg',
      productPrice: 50,
      productTitle: 'feaver',
      items: 1,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Text('Checkout'),
      ),
      body: GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          // mainAxisSpacing: 10,
          childAspectRatio: 1.60,
        ),
        itemBuilder: ((context, index) => BuyProductFromShop(
              imagePath: data[index].imagePath,
              productPrice: data[index].productPrice,
              productTitle: data[index].productTitle,
              items: data[index].items,
            )),
      ),
    );
  }
}

class BuyProductFromShop extends StatefulWidget {
  BuyProductFromShop({
    Key? key,
    required this.items,
    required this.imagePath,
    required this.productPrice,
    required this.productTitle,
  }) : super(key: key);
  final int items;
  final String imagePath;
  final String productTitle;
  final int productPrice;

  @override
  State<BuyProductFromShop> createState() => _BuyProductFromShopState();
}

class _BuyProductFromShopState extends State<BuyProductFromShop> {
  int totalPriceBuy = 0;
  int totalProduct = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      totalPriceBuy = widget.productPrice * widget.items;
      totalProduct = widget.items;
    });
  }

  Widget build(BuildContext context) {
    @override
    var size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
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
                child: Image.asset('images/Doctor.jpeg'),
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                child:
                    Text('Items Total(' + totalProduct.toString() + ' Items)'),
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
          color: Colors.black,
          thickness: 5,
          endIndent: 15,
          indent: 15,
        ),
      ],
    );
  }
}
