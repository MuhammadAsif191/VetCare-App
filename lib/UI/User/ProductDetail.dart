import 'package:flutter/material.dart';
import 'BuNowScreen.dart';

String locationBotom = 'Punjab,Gujrat,Marghaza';

class ProductDetails extends StatefulWidget {
  ProductDetails(
      {Key? key,
      required this.imagePath,
      required this.productPrice,
      required this.Shipping,
      required this.productTitle})
      : super(key: key);
  final String productTitle;
  final String imagePath;
  final int productPrice;
  final String Shipping;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    String ShopTitle = 'Thrifty';
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[350],
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BuyNowScreen(
                imagePath: widget.imagePath,
                productPrice: widget.productPrice.toString(),
                productShipping: widget.Shipping,
                productTitle: widget.productTitle,
                shopName: ShopTitle,
              ),
            ),
          );
        },
        child: Container(
          // padding: EdgeInsets.only(top: 20, left: (size.width / 9) - 20),
          alignment: Alignment.center,
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green[500],
          ),
          child: Text(
            'Buy Now',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.productTitle),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Image.network(widget.imagePath),
          ),
          Expanded(
            flex: 5,
            child: DetailsOfProducts(
              shipping: widget.Shipping,
              imgloc: widget.imagePath,
              shopName: ShopTitle,
              title: widget.productTitle,
              price: widget.productPrice,
            ),
          ),
        ],
      ),
    );
  }
}

class GetLocationBottomSheet extends StatefulWidget {
  const GetLocationBottomSheet({Key? key}) : super(key: key);

  @override
  State<GetLocationBottomSheet> createState() => _GetLocationBottomSheetState();
}

class _GetLocationBottomSheetState extends State<GetLocationBottomSheet> {
  TextEditingController locationChanger = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      locationChanger.text = '';
    });
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: locationChanger,
              decoration: InputDecoration(
                // border: InputBorder.none,
                labelText: 'Enter Your Location',
                hintText: 'Enter Your Location',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              setState(() {
                locationBotom = locationChanger.text;
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: 70,
              width: 200,
              // padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: BorderRadius.circular(60),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DetailsOfProducts extends StatelessWidget {
  const DetailsOfProducts({
    Key? key,
    required this.shopName,
    required this.title,
    required this.imgloc,
    required this.price,
    required this.shipping,
  }) : super(key: key);
  final String imgloc;
  final String shopName;
  final String title;
  final int price;
  final String shipping;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 12, left: 7),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Text(
              title,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 1, left: 7),
            width: double.infinity,
            height: 25,
            // color: Colors.orange,
            child: Text.rich(
              TextSpan(
                text: 'Rs. ',
                children: <InlineSpan>[
                  TextSpan(
                    text: price.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 4,
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
          RatingBar(ratting: 3, starsRating: 3),
          Divider(
            height: 4,
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
        ],
      ),
    );
  }
}

class RatingBar extends StatefulWidget {
  const RatingBar({
    Key? key,
    required this.ratting,
    required this.starsRating,
  }) : super(key: key);
  final int ratting;
  final int starsRating;

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  bool status = false;
  @override
  bool pressed = false;
  void initState() {
    super.initState();
    setState(() {
      status = !status;
      pressed = !pressed;
    });
  }

  Widget build(BuildContext context) {
    Widget wishList = Icon(Icons.favorite_border_sharp);
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.star,
            size: 20,
            color: Colors.yellow[800],
          ),
          Text(widget.starsRating.toString() + "/5"),
          SizedBox(
            width: 7,
          ),
          Text(widget.ratting.toString() + ' Ratings'),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios_sharp,
              size: 15,
            ),
          ),
          SizedBox(
            width: 60,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pressed = !pressed;
              });
            },
            color: pressed == false ? Colors.pink[400] : Colors.black,
            icon: pressed == false
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border_sharp),
          ),
          SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share_outlined),
          ),
        ],
      ),
    );
  }
}
