class Offer {
  final String title;
  final String imageUrl;
  final String detail;
  final String postedOn;

  Offer(
      {required this.title,
      required this.imageUrl,
      required this.detail,
      required this.postedOn});

  static Offer fromJson(json) => Offer(
        title: json['title'],
        imageUrl: json['imageUrl'],
        detail: json['detail'],
        postedOn: json['postedOn'],
      );
}
