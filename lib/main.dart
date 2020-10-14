import 'package:flutter/material.dart';
import 'AlQuran.dart';

void main() {
  runApp(MaterialApp(
    title: "Al-Qur'an XII RPL",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Al-Qur'an XII RPL",
      home: AlQuran(),
    );
  }
}
