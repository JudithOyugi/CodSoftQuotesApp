class QuoteModel {
  String text;
  String author;

  // Provide non-null default values for parameters in the constructor
  QuoteModel({this.text = "", this.author = ""});

  // Initialize fields directly in the constructor
  QuoteModel.fromJson(Map<String, dynamic> json)
      : text = json['text'] ?? "", // Provide a default value if json['text'] is null
        author = json['author'] ?? ""; // Provide a default value if json['author'] is null

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['author'] = author;
    return data;
  }
}
