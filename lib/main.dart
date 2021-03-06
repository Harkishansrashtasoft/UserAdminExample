import 'package:flutter/material.dart';
import 'package:user_admin_example/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
