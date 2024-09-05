import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiosnap/components/bottombar.dart';
import 'package:studiosnap/screens/home/comp/clickable-con.dart';
import 'package:studiosnap/screens/home/comp/homeappbar.dart';
import 'package:studiosnap/screens/profile/appinfo.dart';
import 'package:studiosnap/screens/profile/card.dart';

class ProfilePage extends StatefulWidget {
  final String userName;
  const ProfilePage({super.key, required this.userName});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: BottomBar(
          userName: widget.userName,
          currentIndex: 2,
        ),
      ),
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileCard(userName: widget.userName),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black26, width: 2),
                    ),
                  ),
                ),
                AppAbout()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
