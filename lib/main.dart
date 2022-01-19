import 'package:Flipr/screens/home/home_screen.dart';
import 'package:Flipr/services/seller_sheets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCxEeWnPtMMIxIm61gsRQp2Gy-GppgEXSI",
          authDomain: "flipr-23b08.firebaseapp.com",
          projectId: "flipr-23b08",
          storageBucket: "flipr-23b08.appspot.com",
          messagingSenderId: "808385496554",
          appId: "1:808385496554:web:2d20ec633acaa7c2a8de93",
          measurementId: "G-XY1390JXK0"));
  await SellerSheetsApi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //removing debugbanner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: const HomeScreen(),
    );
  }
}
