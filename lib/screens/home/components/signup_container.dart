import 'package:Flipr/model.dart/responsive.dart';
import 'package:Flipr/screens/home/components/banner_section.dart';
import 'package:Flipr/services/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import 'footer.dart';
import 'header.dart';

class SignupContainer extends StatelessWidget {
  const SignupContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    ? const SignupCard()
                    : const MobBanner(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SignupCard extends StatefulWidget {
  const SignupCard({Key? key}) : super(key: key);

  @override
  State<SignupCard> createState() => _SignupCardState();
}

class _SignupCardState extends State<SignupCard> {
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController bdayController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1960, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Sign up with Google',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              // UserRepository(googleSignin: null).signInWithGoogle();
            },
            child: Container(
              height: 45,
              width: 75,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                  )),
              child: SvgPicture.asset("assets/icons/google-icon.svg"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // const Divider(),
          const Text(
            'OR',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Enter Details to Sign up',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('First Name :'),
              const SizedBox(
                width: 45,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                width: kMaxWidth / 2,
                height: 80,
                child: TextFormField(
                  cursorColor: kSecondaryColor,
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kSecondaryColor, width: 2.0),
                        // borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "",
                      fillColor: Colors.white70),
                  controller: fNameController,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Last Name :'),
              const SizedBox(
                width: 45,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                width: kMaxWidth / 2,
                height: 80,
                child: TextFormField(
                  cursorColor: kSecondaryColor,
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kSecondaryColor, width: 2.0),
                        // borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "",
                      fillColor: Colors.white70),
                  controller: lNameController,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 50.0,
              ),
              const Text('Birthdate : '),
              const SizedBox(
                width: 35.0,
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(12.0),
                width: kMaxWidth * 0.5,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    MaterialButton(
                      color: kSecondaryColor,
                      onPressed: () => _selectDate(context),
                      child: const Text(
                        'Select date',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Your Email :'),
              const SizedBox(
                width: 45,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                width: kMaxWidth / 2,
                height: 80,
                child: TextFormField(
                  cursorColor: kSecondaryColor,
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kSecondaryColor, width: 2.0),
                        // borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "",
                      fillColor: Colors.white70),
                  controller: emailController,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Your Password :'),
              const SizedBox(
                width: 25,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: kMaxWidth / 2,
                height: 80,
                child: TextFormField(
                  // keyboardType: TextInputType,
                  cursorColor: kSecondaryColor,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kSecondaryColor, width: 2.0),
                        // borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "",
                      fillColor: Colors.white70),
                  controller: pwController,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Confirm Password :'),
              const SizedBox(
                width: 5,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: kMaxWidth / 2,
                height: 80,
                child: TextFormField(
                  // keyboardType: TextInputType,
                  cursorColor: kSecondaryColor,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kSecondaryColor, width: 2.0),
                        // borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "",
                      fillColor: Colors.white70),
                  controller: confirmPwController,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
