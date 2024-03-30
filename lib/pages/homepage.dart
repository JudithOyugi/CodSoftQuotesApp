import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quote_app/models/quote_model.dart';
import 'package:quote_app/widgets/quote_widget.dart';
import 'package:http/http.dart' as http;
import 'package:random_color/random_color.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var apiURL = "https://type.fit/api/quotes";

  Future<List<QuoteModel>> getPost() async {
    final response = await http.get(Uri.parse(apiURL));
    return postFromJson(response.body);
  }

  List<QuoteModel> postFromJson(String str) {
    final jsonData = jsonDecode(str) as List;
    return jsonData.map((json) => QuoteModel.fromJson(json)).toList();
  }

  final RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade400,
      body: FutureBuilder<List<QuoteModel>>(
        future: getPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return PageView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final quote = snapshot.data?[index];
                if (quote == null) return const SizedBox();

                return QuoteWidget(
                  quote: quote.text,
                  author: quote.author,
                  bgColor: _randomColor.randomColor(
                    colorHue: ColorHue.multiple(
                      colorHues: [ColorHue.red, ColorHue.blue],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
