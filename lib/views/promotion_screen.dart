import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'offer_localpage.dart';
import 'offers_networkpage.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({Key? key}) : super(key: key);

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Color(0xFFE57734),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Color(0xFFE57734)),
          ),
          tabs: [
            Tab(text: "Every Day Offers"),
            Tab(text: "Latest Offers"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          OffersLocalPage(),
          OffersNetworkPage(),
        ],
      ),
    );
  }
}
