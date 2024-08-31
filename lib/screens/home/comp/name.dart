import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameComp extends StatelessWidget {
  final String userName;

  const NameComp({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        children: [
          Text(
            "Selamat Datang",
            style: GoogleFonts.jost(
              color: Colors.black45,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.24,
            ),
          ),
          Text(
            '$userName',
            style: GoogleFonts.jost(
              color: Colors.black,
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.24,
            ),
          ),
        ],
      ),
    );
  }
}
