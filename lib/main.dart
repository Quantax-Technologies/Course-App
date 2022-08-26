import 'package:courseapp/Screen/Auth/login_screen.dart';
import 'package:courseapp/Screen/Auth/login_signup_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginSignupHome(),
    );
  }
}
