import 'package:Flipr/screens/about_screen.dart';
import 'package:Flipr/screens/academy_screen.dart';
import 'package:Flipr/screens/home/home_screen.dart';
import 'package:Flipr/screens/sell_screen.dart';
import 'package:Flipr/services/user_repo.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'auth_container.dart';

class HeaderWebMenu extends StatefulWidget {
  const HeaderWebMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderWebMenu> createState() => _HeaderWebMenuState();
}

class _HeaderWebMenuState extends State<HeaderWebMenu> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeaderMenu(
          press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutScreem()));
          },
          title: "About",
        ),
        const SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AcademyScreen()));
          },
          title: "Academy",
        ),
        const SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SellScreen()));
          },
          title: "Sell",
        ),
        const SizedBox(
          width: kPadding,
        ),
        InkWell(
            onTap: userEmail == null
                ? () {
                    showDialog(
                      context: context,
                      builder: (context) => AuthDialog(),
                    );
                  }
                : null,
            child: userEmail == null
                ? const Text(
                    'Sign in',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  )
                : Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            imageUrl != null ? NetworkImage(imageUrl!) : null,
                        child: imageUrl == null
                            ? const Icon(
                                Icons.account_circle,
                                size: 30,
                              )
                            : Container(),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        name ?? userEmail!,
                        // style: TextStyle(
                        // color: _isHovering[3]
                        //     ? Colors.white
                        //     : Colors.white70,
                        // ),
                      ),
                      const SizedBox(width: 10),
                      const SizedBox(
                        width: kPadding,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: _isProcessing
                            ? null
                            : () async {
                                setState(() {
                                  _isProcessing = true;
                                });
                                await signOut().then((result) {
                                  print(result);
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                }).catchError((error) {
                                  print('Sign Out Error: $error');
                                });
                                setState(() {
                                  _isProcessing = false;
                                });
                              },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            bottom: 8.0,
                          ),
                          child: _isProcessing
                              ? const CircularProgressIndicator()
                              : const Text(
                                  'Sign out',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                        ),
                      )
                    ],
                  )),
        const SizedBox(
          width: kPadding,
        ),
      ],
    );
  }
}

class MobFooterMenu extends StatelessWidget {
  const MobFooterMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        HeaderMenu(
          press: () {},
          title: "Sell",
        ),
        const SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "Academy",
        ),
        const SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "About",
        ),
        const SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "Log in",
        ),
        const SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "Sign up",
        ),
      ],
    );
  }
}

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }
}

class MobMenu extends StatefulWidget {
  const MobMenu({Key? key}) : super(key: key);

  @override
  _MobMenuState createState() => _MobMenuState();
}

class _MobMenuState extends State<MobMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderMenu(
            press: () {},
            title: "Menu",
          ),
          const SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {},
            title: "For Riders",
          ),
          const SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {},
            title: "About",
          ),
          const SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {},
            title: "Reviews",
          ),
          const SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {},
            title: "Restaurants",
          ),
        ],
      ),
    );
  }
}
