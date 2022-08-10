import 'package:flutter/material.dart';

class VetStoredata {
  VetStoredata({
    required this.imageLocation,
    required this.productDescription,
    required this.productName,
    required this.productPrice,
    required this.productRating,
    required this.productShipping,
  });
  late String imageLocation;
  late String productName;
  late int productPrice;
  late int productRating;
  late String productShipping;
  late String productDescription;
}
