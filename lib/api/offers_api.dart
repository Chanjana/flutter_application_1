import 'dart:convert';
import 'package:cafe_americano_two/models/offer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OffersApi {
  static Future<List<Offer>> getOffers() async {
    final url = Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/fireconnect-fdb42.appspot.com/o/offers.json?alt=media&token=acf8da67-67cf-4594-a40e-22851bb37dcf');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return body.map<Offer>((json) => Offer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load offers');
    }
  }

  static Future<List<Offer>> getOffersLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/offers.json');
    final List<dynamic> body = json.decode(data);

    return body.map<Offer>((json) => Offer.fromJson(json)).toList();
  }
}
