import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiosnap/components/spbutton.dart';
import 'package:studiosnap/screens/splash/log.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: Colors.black38),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/image/splash/splashscreen_img.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ],
              )),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
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
                          fontSize: 22,
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
                              fontSize: 12,
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
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              height: 0,
                              letterSpacing: 0.36,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
