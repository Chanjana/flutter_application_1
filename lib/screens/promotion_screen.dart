import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({super.key});

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
          automaticallyImplyLeading: false, // This removes the back button
          centerTitle: true,
          title: Text(
            "Offers",
            style: GoogleFonts.pacifico(
              fontSize: 20,
              color: Colors.white,
            ),
          )),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView.builder(
            itemCount: _offers.length,
            itemBuilder: (BuildContext context, int index) {
              final item = _offers[index];
              return Container(
                height: 136,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text("${item.detail} · ${item.postedOn}",
                            style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icons.bookmark_border_rounded,
                            Icons.share,
                          ].map((e) {
                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(e, size: 16),
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    )),
                    Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(item.imageUrl),
                            ))),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

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
}

final List<Offer> _offers = [
  Offer(
    title: "CHRISTMAS SPECIAL",
    detail: "Buy one COFFEE and get the second FREE",
    imageUrl: "images/promo1.jpg",
    postedOn: "4 hours ago",
  ),
  Offer(
      title: "SUNDAY SPECIAL",
      imageUrl: "images/promo2.jpg",
      detail: "Buy one COFFEE and get the second FREE",
      postedOn: "Yesterday"),
  Offer(
    title: "International Coffee day",
    detail: "Discount upto 25%",
    imageUrl: "images/promo3.jpg",
    postedOn: "2 days ago",
  ),
  Offer(
    title: "SUNDAY SPECIAL",
    detail: "Save 500 LKR for every 3000 LKR spent",
    imageUrl: "images/promo4.jpg",
    postedOn: "9 days ago",
  ),
  Offer(
    title: "CHRISTMAS SPECIAL",
    detail: "Buy one COFFEE and get the second FREE",
    imageUrl: "images/promo1.jpg",
    postedOn: "4 hours ago",
  ),
  Offer(
      title: "SUNDAY SPECIAL",
      imageUrl: "images/promo2.jpg",
      detail: "Buy one COFFEE and get the second FREE",
      postedOn: "Yesterday"),
];
