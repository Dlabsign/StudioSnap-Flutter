import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studiosnap/screens/splash/splashscreen1.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SplashScreen1()),
        );
      });
    });
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        // Mengatur ukuran font dan elemen lain berdasarkan lebar layar
        double titleFontSize =
            screenWidth * 0.10; // Font size untuk "StudioSnap"
        double subtitleFontSize =
            screenWidth * 0.028; // Font size untuk "Capture Your Moment With"
        double creatorFontSize =
            screenWidth * 0.03; // Font size untuk "Created By"
        double logoHeight = screenWidth * 0.05; // Tinggi logo SVG

        return Stack(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  Text(
                    "Capture Your Moment With",
                    style: GoogleFonts.jost(
                      color: Colors.black,
                      fontSize: subtitleFontSize,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      letterSpacing: 0.24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "StudioSnap",
                    style: GoogleFonts.jost(
                      color: Colors.black,
                      fontSize: titleFontSize,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      letterSpacing: 0.24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: 0.59,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Created By",
                      style: GoogleFonts.jost(
                        color: Colors.black,
                        fontSize: creatorFontSize,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/dlabsign.svg',
                          height: logoHeight,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Daniel",
                          style: GoogleFonts.jost(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: creatorFontSize * 1.5,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
