import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutTitle extends StatelessWidget {
  final String Headline;
  final String Desc;
  const AboutTitle({super.key, required this.Desc, required this.Headline});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Headline,
            style: GoogleFonts.jost(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.24,
            ),
          ),
          const SizedBox(
            height: 7.5,
          ),
          Text(
            Desc,
            style: GoogleFonts.jost(
              color: Color(0xFF646363),
              fontSize: 13,
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
