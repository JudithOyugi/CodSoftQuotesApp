import 'package:flutter/material.dart';
import 'package:quote_app/pages/secondpage.dart';

class Firstpage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Firstpage({Key? key});

  @override
  Widget build(BuildContext context) {
    double height = 40;
    double width = 40;
    return Scaffold(
      backgroundColor: Colors.purple.shade200,
      // ignore: avoid_unnecessary_containers
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Image.asset(
              "assets/quote.png",
              height: height,
              width: width,
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 50, color: Colors.black),
                children: [
                  TextSpan(text: "Get\n"),
                  TextSpan(
                    text: "Your Favorite Quote...",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
             Image.asset(
              "assets/smiley.png",
              height: 350,
              width: 350,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Secondpage()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                ),
                child: const Text("Dive In"),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
