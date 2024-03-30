import 'package:flutter/material.dart';
import 'package:quote_app/pages/homepage.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 3,
            ),
            Image.asset("assets/welcome.png",
            width: 200,
            height: 200,
            ),
            const SizedBox(height: 17),
            RichText(
                text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(text: "Hello,\n", style: TextStyle(fontSize: 23)),
                  TextSpan(
                      text: "Welcome to Quotes App..",
                      style: TextStyle(fontSize: 30)),
                ])),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Homepage()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                ),
                child: const Text("Get Quote"),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
