import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SPButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double fontSize;
  final double letterSpacing;

  const SPButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontSize = 16.0,
    this.letterSpacing = 0.55,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1D1D1D),
          padding: EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.jost(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            letterSpacing: letterSpacing,
          ),
        ),
      ),
    );
  }
}
