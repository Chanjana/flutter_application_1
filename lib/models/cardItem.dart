class CardItem {
  final String title;
  final String imageUrl;
  final String detail;
  final String description;

  CardItem(
      {required this.title,
      required this.imageUrl,
      required this.detail,
      required this.description});

  factory CardItem.fromJson(Map<String, dynamic> json) {
    return CardItem(
      title: json['title'],
      imageUrl: json['imageUrl'],
      detail: json['detail'],
      description: json['description'],
    );
  }
}
