import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        shape: const Border(
          bottom:
              BorderSide(width: 1.2, color: Color.fromARGB(255, 101, 101, 101)),
        ),
        flexibleSpace: LayoutBuilder(
          builder: (context, constraints) {
            double paddingValue = constraints.maxWidth > 600 ? 50 : 30;
            double fontSize = constraints.maxWidth > 600 ? 24 : 18;
            double logoHeight = constraints.maxWidth > 600 ? 80 : 60;

            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Capture Your Moment With",
                  style: GoogleFonts.jost(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.24,
                  ),
                ),
                Text(
                  "StudioSnap",
                  style: GoogleFonts.jost(
                    color: Colors.black,
                    fontSize: 46,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.24,
                  ),
                ),
              ],
            );
          },
        ));
  }
}
