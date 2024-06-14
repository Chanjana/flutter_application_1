// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static final String id = 'Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String pname = "";
  String category = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Product"),
              TextField(
                onChanged: (value) {
                  pname = value;
                },
                decoration: InputDecoration(
                    hintText: "Product Name", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                onChanged: (value) {
                  category = value;
                },
                decoration: InputDecoration(
                    hintText: "Category", border: OutlineInputBorder()),
              ),
              MaterialButton(
                  child: Text("Add Product"),
                  onPressed: () async {
                    await _firebaseFirestore
                        .collection('Products')
                        .add({'productName': pname, 'category': category});
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
