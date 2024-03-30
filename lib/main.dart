import 'package:flutter/material.dart';
import 'package:quote_app/pages/firstpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Firstpage(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
