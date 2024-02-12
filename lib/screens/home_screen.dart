import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/item_details_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
        length: 4,
        vsync: this,
        initialIndex: 0); //length: The number of tabs is 4
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    //To check if the index of the TabController is changing
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//BuildContext is a dynamic object that refers to the location of the widget within the widget tree.
//It provides a way for widgets to interact with the framework and obtain information about their environment.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const SearchBar(),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabAlignment: TabAlignment.center,
          labelColor: Color(0xFFE57734),
          unselectedLabelColor: Colors.white,
          isScrollable: true,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 3,
              color: Color(0xFFE57734),
            ),
            insets: EdgeInsets.symmetric(horizontal: 16),
          ),
          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          labelPadding: EdgeInsets.symmetric(horizontal: 20),
          tabs: [
            Tab(text: "Hot Coffee"),
            Tab(text: "Cold Coffee"),
            Tab(text: "Cappuccino"),
            Tab(text: "Americano"),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    'images/logo.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.grey.shade800,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    //ListTile displays an icon(leading) and the text "ABOUT" also it can trigger a callback when tapped (if the onTap property is provided)
                    leading: Icon(
                      Icons.info,
                      color: Colors.orange,
                    ),
                    title: Text(
                      'ABOUT',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Colors.orange,
                    ),
                    title: Text(
                      'SETTINGS',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/settings_screen');
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.0, bottom: 85),
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.orange,
                    ),
                    title: Text(
                      'LOGOUT',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/welcome_screen');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //number of columns in the grid is 2
                crossAxisSpacing: 16.0, //horizontal spacing between columns
                mainAxisSpacing: 10.0, //vertical spacing between rows
                childAspectRatio:
                    0.80, // each item will have a width 0.80 times its height
              ),
              itemCount: _carditems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _carditems[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to ItemDetailsScreen on card tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailsScreen(),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: const BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12.0)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(item.imageUrl),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 5.0, bottom: 0.0, top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.detail,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add_box_rounded,
                                  size: 28,
                                  color: Color(0xFFE57734),
                                ),
                                onPressed: () {
                                  // onPressed
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

//search bar
class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!_isActive)
          Text(
            "Caffe Americano",
            style: GoogleFonts.pacifico(
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              child: _isActive
                  ? Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xFFE57734),
                          borderRadius: BorderRadius.circular(4.0)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search...',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isActive = false;
                                  });
                                },
                                icon: const Icon(Icons.close))),
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          _isActive = true;
                        });
                      },
                      icon: const Icon(Icons.search)),
            ),
          ),
        ),
      ],
    );
  }
}

//end search bar

//card items
class CardItem {
  final String title;
  final String imageUrl;
  final String detail;

  CardItem({required this.title, required this.imageUrl, required this.detail});
}

final List<CardItem> _carditems = [
  CardItem(
    title: "Latte",
    detail: "1500 LKR",
    imageUrl: "images/coffee1.jpeg",
  ),
  CardItem(
    title: "Americano",
    detail: "1300 LKR",
    imageUrl: "images/coffee2.jpg",
  ),
  CardItem(
    title: "Ice Coffee",
    detail: "1300 LKR",
    imageUrl: "images/coffee3.jpg",
  ),
  CardItem(
    title: "Mocha",
    detail: "1500 LKR",
    imageUrl: "images/coffee5.jpg",
  ),
  CardItem(
    title: "Cortado",
    detail: "1900 LKR",
    imageUrl: "images/coffee1.jpeg",
  ),
  CardItem(
    title: "Americano",
    detail: "1300 LKR",
    imageUrl: "images/coffee2.jpg",
  ),
];
