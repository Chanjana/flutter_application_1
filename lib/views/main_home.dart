import 'package:cafe_americano_two/views/cart_screen.dart';
import 'package:cafe_americano_two/views/home_screen.dart';
import 'package:cafe_americano_two/views/profile_screen.dart';
import 'package:cafe_americano_two/views/promotion_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int index = 0;

  final screens = [
    HomeScreen(),
    PromotionScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.discount, size: 30),
      Icon(Icons.shopping_bag, size: 30),
      Icon(Icons.person, size: 30),
    ];

    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.black87),
        ),
        child: CurvedNavigationBar(
          color: Colors.orange.shade200.withOpacity(0.8),
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.orange,
          height: 60,
          index: index,
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
