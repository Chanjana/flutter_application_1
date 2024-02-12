import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.pacifico(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Theme(
          data: Theme.of(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset("images/profile.jpg")),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                profileTiles("Name", "Anne Doe"),
                SizedBox(
                  height: 20,
                ),
                profileTiles("Email", "anny45@gmail.com"),
                SizedBox(
                  height: 20,
                ),
                profileTiles("Contact Info", "0719856431"),
              ],
            ),
          )),
    );
  }

  ///profile data tiles
  Widget profileTiles(String label, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: 250,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 2, color: Colors.white),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 180,
                  child: Text(
                    data ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
