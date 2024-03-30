import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

class QuoteWidget extends StatefulWidget {
  final String quote;
  final String author;
  final Function()? onShareClick;
  final Function()? onLikeClick;
  final Color? bgColor;

  const QuoteWidget({
    Key? key,
    required this.quote,
    required this.author,
    this.onShareClick,
    this.onLikeClick,
    this.bgColor,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QuoteWidgetState createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgColor,
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(
            flex: 2,
          ),
          Image.asset(
            "assets/quote.png",
            height: 30,
            width: 30,
            color: Colors.white,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            widget.quote,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            widget.author,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                _isLiked = !_isLiked;
              });
              if (widget.onLikeClick != null) {
                widget.onLikeClick!();
              }
            },
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.white),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.favorite,
                      color: _isLiked ? Colors.red : Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (widget.onShareClick != null) {
                        widget.onShareClick!();
                      }
                      _shareQuote(widget.quote);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _shareQuote(String quote) async {
    await FlutterShare.share(
      title: 'Quote',
      text: quote,
      chooserTitle: 'Share',
    );
  }
}
