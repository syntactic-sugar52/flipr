import 'package:flutter/material.dart';

import '../../../constants.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // ignore: prefer_const_literals_to_create_immutables
      children: const [
        Services(
          image: "assets/images/developer.jpg",
          title: "Trusted and Verified Sellers",
          desc: "",
        ),
        Services(
          image: "assets/images/unique.jpeg",
          title: "Unique Digital Selection",
          desc: "",
        ),
        Services(
          image: "assets/images/offer.jpg",
          title: "Best Prices",
          desc: "",
        ),
      ],
    );
  }
}

class Services extends StatelessWidget {
  const Services(
      {Key? key, required this.image, required this.title, required this.desc})
      : super(key: key);
  final String image, title, desc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: const EdgeInsets.all(kPadding / 2),
          width: 300,
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      image,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                desc,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
