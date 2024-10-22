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
            "Pelayanan Kami",
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
            "Di StudioSnap, kami menawarkan berbagai layanan yang disesuaikan untuk memenuhi semua kebutuhan fotografi Anda. Baik Anda ingin mengabadikan momen, menciptakan visual yang menakjubkan, atau menghasilkan konten profesional, kami siap membantu Anda.",
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
