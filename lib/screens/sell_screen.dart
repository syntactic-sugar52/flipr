import 'package:Flipr/model.dart/responsive.dart';
import 'package:Flipr/model.dart/sellerfields.dart';
import 'package:Flipr/services/seller_sheets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';
import 'home/components/banner_section.dart';
import 'home/components/header.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        ? const SellerContainer()
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

class SellerContainer extends StatefulWidget {
  const SellerContainer({Key? key}) : super(key: key);

  @override
  State<SellerContainer> createState() => _SellerContainerState();
}

class _SellerContainerState extends State<SellerContainer> {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController demoVideoLinkController = TextEditingController();
  late TextEditingController productDescController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Seller Form',
            style: TextStyle(
              fontSize: 18,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text('Full Name'),
          buildNameTextField(),
          const Text('Email Address'),
          buildEmailTextField(),
          const Text('Product Demo Video Link'),
          buildDemoLinkTextField(),
          const Text('Product Description'),
          buildProductDescTextField(),
          buildSendButton(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  SizedBox buildNameTextField() => SizedBox(
        width: kMaxWidth / 2,
        height: 80,
        child: TextFormField(
          cursorColor: kSecondaryColor,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kSecondaryColor, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "",
              fillColor: Colors.white70),
          controller: nameController,
          validator: (value) =>
              value != null && value.isEmpty ? 'Enter Full Name' : null,
        ),
      );
  SizedBox buildEmailTextField() => SizedBox(
        width: kMaxWidth / 2,
        height: 80,
        child: TextFormField(
          cursorColor: kSecondaryColor,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kSecondaryColor, width: 2.0),
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
          validator: (value) => value != null && !value.contains('@')
              ? 'Enter a valid email'
              : null,
        ),
      );
  SizedBox buildDemoLinkTextField() => SizedBox(
        width: kMaxWidth / 2,
        height: 80,
        child: TextFormField(
          cursorColor: kSecondaryColor,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kSecondaryColor, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "",
              fillColor: Colors.white70),
          controller: demoVideoLinkController,
          validator: (value) => value != null && !value.contains('https://')
              ? 'Enter a valid link'
              : null,
        ),
      );
  SizedBox buildProductDescTextField() => SizedBox(
        width: kMaxWidth / 2,
        height: 180,
        child: TextFormField(
          cursorColor: kSecondaryColor,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          minLines: 1,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kSecondaryColor, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "",
              fillColor: Colors.white70),
          controller: productDescController,
          validator: (value) => value != null && value.isEmpty
              ? 'Enter product description'
              : null,
        ),
      );
  MaterialButton buildSendButton() => MaterialButton(
        height: 55,
        color: kSecondaryColor,
        onPressed: () async {
          final form = formKey.currentState!;
          final isValid = form.validate();
          if (isValid) {
            final id = await SellerSheetsApi.getRowCount() + 1;
            final user = SellerModel(
                id: id,
                demoVideoLink: demoVideoLinkController.text.trim(),
                email: emailController.text.trim(),
                name: nameController.text.trim(),
                productDescription: productDescController.text.trim());
            await SellerSheetsApi.insert([user.toJson()]);
            Fluttertoast.showToast(
                msg:
                    "Thank you for submitting your product. We will contact you soon.",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.SNACKBAR,
                webPosition: "center",
                webShowClose: true,
                timeInSecForIosWeb: 20,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        child: const Text(
          "Send",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      );
}
