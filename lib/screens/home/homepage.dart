import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiosnap/screens/home/comp/homeappbar.dart';
import 'package:studiosnap/screens/home/comp/name.dart';

class HomePage extends StatefulWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NameComp(
              userName: widget.userName,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Our Services",
                    style: GoogleFonts.jost(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.24,
                    ),
                  ),
                  Text(
                    "At StudioSnap, we offer a variety of tailored services to meet all your photography needs. Whether you’re capturing memories, creating stunning visuals, or producing professional content, we’ve got you covered.",
                    style: GoogleFonts.jost(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.24,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
