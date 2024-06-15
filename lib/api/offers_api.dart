import 'dart:convert'; // Importing the JSON encoding and decoding library
import 'package:cafe_americano_two/models/offer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OffersApi {
  // Method to fetch offers from a remote server
  static Future<List<Offer>> getOffers() async {
    final url = Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/fireconnect-fdb42.appspot.com/o/offers.json?alt=media&token=acf8da67-67cf-4594-a40e-22851bb37dcf');
    final response = await http.get(url); // Making a GET request to the server

    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response
          .body); // Decode the JSON response into a list of dynamic objects
      return body
          .map<Offer>((json) => Offer.fromJson(json))
          .toList(); // Map each dynamic object to an Offer instance and return the list of offers
    } else {
      throw Exception('Failed to load offers');
    }
  }

  // Method to fetch offers from a local JSON file
  static Future<List<Offer>> getOffersLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(
        context); // Access the asset bundle of the current build context
    final data = await assetBundle.loadString(
        'assets/offers.json'); // Load the JSON file from the assets folder
    final List<dynamic> body = json.decode(data);

    return body.map<Offer>((json) => Offer.fromJson(json)).toList();
  }
}
