import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiosnap/components/spbutton.dart';
import 'package:studiosnap/screens/splash/log.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height / 2,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: Colors.black38),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/image/splash/photo2.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ],
            ),
          ),
          Container(
            height: size.height / 2,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: isSmallScreen ? 20 : 30,
              horizontal: isSmallScreen ? 20 : 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Setiap Jepretan terukir sebuah kisah, Booking Studio lebih mudah dengan StudioSnap Sekarang",
                        style: GoogleFonts.jost(
                          color: Color.fromARGB(255, 24, 24, 24),
                          fontSize: isSmallScreen ? 18 : 22,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                          letterSpacing: 0.36,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Capture Your moment with",
                            style: GoogleFonts.jost(
                              color: Colors.black,
                              fontSize: isSmallScreen ? 10 : 12,
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.36,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "StudioSnap",
                            style: GoogleFonts.jost(
                              color: Colors.black,
                              fontSize: isSmallScreen ? 10 : 12,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              height: 0,
                              letterSpacing: 0.36,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SPButton(
                  text: "Selanjutnya",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LogPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
