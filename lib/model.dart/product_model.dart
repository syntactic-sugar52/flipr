import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int id;

  Product({
    required this.id,
    required this.image,
    required this.title,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "NFT",
    image: "assets/images/nftbloc.jpeg",
  ),
  Product(
    id: 2,
    title: "Mobile Apps",
    image: "assets/images/mobileapp.jpeg",
  ),
  Product(
    id: 3,
    title: "Websites",
    image: "assets/images/website.png",
  ),
  Product(
    id: 4,
    title: "Software",
    image: "assets/images/software.png",
  ),
  Product(
    id: 5,
    title: "Graphic Design",
    image: "assets/images/design.jpeg",
  ),
  Product(
    id: 6,
    title: "Security",
    image: "assets/images/security.png",
  ),
];
