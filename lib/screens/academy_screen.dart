import 'package:Flipr/model.dart/responsive.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'home/components/banner_section.dart';
import 'home/components/header.dart';

class AcademyScreen extends StatelessWidget {
  const AcademyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: kPrimaryColor,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(kPadding),
                constraints: const BoxConstraints(maxWidth: kMaxWidth),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Header(),
                    const SizedBox(
                      height: 40,
                    ),
                    Responsive.isDesktop(context)
                        ? const AcademyContainer()
                        : const MobBanner(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AcademyContainer extends StatelessWidget {
  const AcademyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
            'Flipr Academy is where we mentor aspiring start up founders for 6 months.')
      ],
    );
  }
}
