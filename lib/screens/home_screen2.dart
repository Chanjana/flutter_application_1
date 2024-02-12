// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/widgets/home_bottom_bar.dart';
// import 'package:flutter_application_1/widgets/items_widget.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
//     _tabController.addListener(_handleTabSelection);
//     super.initState();
//   }

//   _handleTabSelection() {
//     if (_tabController.indexIsChanging) {
//       setState(() {});
//     }
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.only(top: 15),
//           child: ListView(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       InkWell(
//                         onTap: () {},
//                         child: Icon(
//                           Icons.sort_rounded,
//                           color: Colors.white.withOpacity(0.5),
//                           size: 35,
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: Icon(
//                           Icons.shopping_bag_rounded,
//                           color: Colors.white.withOpacity(0.5),
//                           size: 30,
//                         ),
//                       )
//                     ]),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: Text(
//                   "It's a Great Day for Coffee",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//                 width: MediaQuery.of(context).size.width,
//                 height: 50,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 50, 54, 56),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Find your Dream Coffee",
//                       hintStyle: TextStyle(
//                         color: Colors.white.withOpacity(0.5),
//                       ),
//                       prefixIcon: Icon(
//                         Icons.search,
//                         size: 30,
//                         color: Colors.white.withOpacity(0.5),
//                       )),
//                 ),
//               ),
//               TabBar(
//                   controller: _tabController,
//                   tabAlignment: TabAlignment.center,
//                   labelColor: Color(0xFFE57734),
//                   unselectedLabelColor: Colors.white.withOpacity(0.5),
//                   isScrollable: true,
//                   indicator: UnderlineTabIndicator(
//                     borderSide: BorderSide(
//                       width: 3,
//                       color: Color(0xFFE57734),
//                     ),
//                     insets: EdgeInsets.symmetric(horizontal: 16),
//                   ),
//                   labelStyle:
//                       TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//                   labelPadding: EdgeInsets.symmetric(horizontal: 20),
//                   tabs: [
//                     Tab(text: "Hot Coffee"),
//                     Tab(text: "Cold Coffee"),
//                     Tab(text: "Cappuccino"),
//                     Tab(text: "Americano"),
//                   ]),
//               SizedBox(height: 10),
//               Center(
//                 child: [
//                   ItemsWidget(),
//                   ItemsWidget(),
//                   ItemsWidget(),
//                   ItemsWidget(),
//                 ][_tabController.index],
//               )
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: HomeBottomBar(),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/widgets/home_bottom_bar.dart';
// import 'package:flutter_application_1/widgets/items_widget.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
//     _tabController.addListener(_handleTabSelection);
//     super.initState();
//   }

//   _handleTabSelection() {
//     if (_tabController.indexIsChanging) {
//       setState(() {});
//     }
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.only(top: 15),
//           child: ListView(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       InkWell(
//                         onTap: () {},
//                         child: Icon(
//                           Icons.sort_rounded,
//                           color: Colors.white.withOpacity(0.5),
//                           size: 35,
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: Icon(
//                           Icons.shopping_bag_rounded,
//                           color: Colors.white.withOpacity(0.5),
//                           size: 30,
//                         ),
//                       )
//                     ]),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: Text(
//                   "It's a Great Day for Coffee",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//                 width: MediaQuery.of(context).size.width,
//                 height: 50,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 50, 54, 56),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Find your Dream Coffee",
//                       hintStyle: TextStyle(
//                         color: Colors.white.withOpacity(0.5),
//                       ),
//                       prefixIcon: Icon(
//                         Icons.search,
//                         size: 30,
//                         color: Colors.white.withOpacity(0.5),
//                       )),
//                 ),
//               ),
//               TabBar(
//                   controller: _tabController,
//                   tabAlignment: TabAlignment.center,
//                   labelColor: Color(0xFFE57734),
//                   unselectedLabelColor: Colors.white.withOpacity(0.5),
//                   isScrollable: true,
//                   indicator: UnderlineTabIndicator(
//                     borderSide: BorderSide(
//                       width: 3,
//                       color: Color(0xFFE57734),
//                     ),
//                     insets: EdgeInsets.symmetric(horizontal: 16),
//                   ),
//                   labelStyle:
//                       TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//                   labelPadding: EdgeInsets.symmetric(horizontal: 20),
//                   tabs: [
//                     Tab(text: "Hot Coffee"),
//                     Tab(text: "Cold Coffee"),
//                     Tab(text: "Cappuccino"),
//                     Tab(text: "Americano"),
//                   ]),
//               SizedBox(height: 10),
//               Center(
//                 child: [
//                   ItemsWidget(),
//                   ItemsWidget(),
//                   ItemsWidget(),
//                   ItemsWidget(),
//                 ][_tabController.index],
//               )
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: HomeBottomBar(),
//     );
//   }
// }



// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_application_1/widgets/items_widget.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final items = <Widget>[
//       Icon(Icons.home, size: 30),
//       Icon(Icons.discount, size: 30),
//       Icon(Icons.shopping_bag, size: 30),
//       Icon(Icons.person, size: 30),
//     ];

//     return Scaffold(
//       extendBody: true,
//       bottomNavigationBar: Theme(
//         data: Theme.of(context).copyWith(
//           iconTheme: IconThemeData(color: Colors.black87),
//         ),
//         child: CurvedNavigationBar(
//           backgroundColor: Colors.transparent,
//           buttonBackgroundColor: Colors.orange,
//           height: 60,
//           items: items,
//         ),
//       ),
//     );
//   }
// }
