import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescComp extends StatelessWidget {
  const DescComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Our Services",
            style: GoogleFonts.jost(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.24,
            ),
          ),
          const SizedBox(
            height: 7.5,
          ),
          Text(
            "At StudioSnap, we offer a variety of tailored services to meet all your photography needs. Whether you’re capturing memories, creating stunning visuals, or producing professional content, we’ve got you covered.",
            style: GoogleFonts.jost(
              color: Color(0xFF646363),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.24,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
