import 'package:flutter/material.dart';
import 'AskQuestionAnswer.dart';
import 'BuNowScreen.dart';
import 'ChatToSeller.dart';
import 'MyAccountScreen.dart';
import 'ShopScreenOfProduct.dart';
import 'ShopStoreBuyProducts.dart';

String locationBotom = 'Punjab,Gujrat,Marghaza';

class ProductDetails extends StatefulWidget {
  ProductDetails({
    Key? key,
    required this.imagePath,
    required this.productDesc,
    required this.productPrice,
    required this.productRating,
    required this.productShipping,
    required this.productTitle,
  }) : super(key: key);
  final String imagePath;
  final String productTitle;
  final int productPrice;
  final String productShipping;
  final int productRating;
  final String productDesc;

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
      bottomNavigationBar: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ShopScreenOfProduct(shopName: ShopTitle, name: 'Thrifty'),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10),
              height: 60,
              width: size.width / 3,
              decoration: BoxDecoration(
                color: Colors.green[500],
              ),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.store,
                    color: Colors.red,
                  ),
                  Text(
                    'Store',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SellerChatBox(
                    shopName: ShopTitle,
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10),
              height: 60,
              width: size.width / 3,
              decoration: BoxDecoration(
                color: Colors.green[500],
              ),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.chat,
                    color: Colors.red,
                  ),
                  Text('Chat', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BuyNowScreen(
                    imagePath: widget.imagePath,
                    productDesc: widget.productDesc,
                    productPrice: widget.productPrice,
                    productRating: widget.productRating,
                    productShipping: widget.productShipping,
                    productTitle: widget.productTitle,
                    shopName: ShopTitle,
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 20, left: (size.width / 9) - 20),
              height: 60,
              width: size.width / 3,
              decoration: BoxDecoration(
                color: Colors.green[500],
              ),
              child: Text(
                'Buy Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(''),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DisplayStoredBuyProducts(),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          PopupMenuButton(
            onSelected: (value) {
              if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAccountScreen(),
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text('My Account'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Image.asset(widget.imagePath),
          ),
          Expanded(
            flex: 5,
            child: DetailsOfProducts(
              shopName: ShopTitle,
              title: widget.productTitle,
              description: widget.productDesc,
              price: widget.productPrice,
              rating: widget.productRating,
              shipping: widget.productShipping,
            ),
          ),
          Expanded(
            flex: 3,
            child: BottomContainer(
              locations: locationBotom,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key, required this.locations}) : super(key: key);
  final String locations;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (context) => GetLocationBottomSheet(),
      ),
      padding: EdgeInsets.all(0),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Text('Delivery'),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        locations,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    Icon(
                      Icons.map_outlined,
                      color: Colors.red,
                    ),
                    Text('Standard Delivery , 3-6 Day(s)'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(Icons.arrow_forward_ios_sharp),
            ),
          ],
        ),
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
    required this.description,
    required this.price,
    required this.rating,
    required this.shipping,
  }) : super(key: key);
  final String shopName;
  final String title;
  final int price;
  final String shipping;
  final int rating;
  final String description;

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
          AskAnyQuestion(context, ''),
          ShopHomeScreen(context, shopName, title),
        ],
      ),
    );
  }

  Widget ShopHomeScreen(BuildContext context, String ShopName, String name) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ShopScreenOfProduct(shopName: shopName, name: name),
          ),
        );
      },
      color: Colors.white,
      shape: null,
      child: Row(
        children: [
          Icon(Icons.shopping_bag_rounded),
          SizedBox(
            width: 10,
          ),
          Container(
            child: Text(
              ShopName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 200,
          ),
          Icon(Icons.arrow_forward_ios_sharp),
        ],
      ),
    );
  }

  Widget AskAnyQuestion(BuildContext context, String chatId) {
    return RaisedButton(
      color: Colors.white,
      shape: null,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionAndAnswer(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 50,
        child: Row(
          children: [
            Icon(Icons.question_answer_outlined),
            SizedBox(
              width: 10,
            ),
            Text('Ask any Questions of the product'),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.arrow_forward_ios_sharp),
          ],
        ),
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
