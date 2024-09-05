import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AppAbout extends StatelessWidget {
  const AppAbout({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600;

    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 235, 235, 252),
              ),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF0404B2),
                  ),
                ),
                child: CircleAvatar(
                  radius: isSmallScreen ? 50 : 70, // Responsive radius
                  foregroundImage: const AssetImage('assets/image/daniel.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Daniel Kurnia",
              style: GoogleFonts.jost(
                fontSize: isSmallScreen ? 20 : 24, // Responsive font size
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "#Designer | #FrontEndDeveloper",
              style: GoogleFonts.jost(
                fontSize: isSmallScreen ? 14 : 16, // Responsive font size
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _launchUrl("https://github.com/Dlabsign");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isSmallScreen ? 15 : 20, 
                      vertical: isSmallScreen ? 8 : 10
                    ), // Responsive padding
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9FC50),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icon/github.png',
                          fit: BoxFit.cover,
                          height: isSmallScreen ? 16 : 20, // Responsive icon size
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "Github",
                          style: GoogleFonts.jost(
                            color: Colors.black,
                            fontSize: isSmallScreen ? 11 : 14, // Responsive font size
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 9),
                GestureDetector(
                  onTap: () {
                    _launchUrl("https://www.instagram.com/danielkuptr/?hl=id");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isSmallScreen ? 15 : 20, 
                      vertical: isSmallScreen ? 8 : 10
                    ), // Responsive padding
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9FC50),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icon/instagram.png',
                          fit: BoxFit.cover,
                          height: isSmallScreen ? 16 : 20, // Responsive icon size
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "Instagram",
                          style: GoogleFonts.jost(
                            color: Colors.black,
                            fontSize: isSmallScreen ? 11 : 14, // Responsive font size
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 9),
                GestureDetector(
                  onTap: () {
                    _launchUrl("https://www.behance.net/danielkurnia");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isSmallScreen ? 15 : 20, 
                      vertical: isSmallScreen ? 8 : 10
                    ), // Responsive padding
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9FC50),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icon/behance.png',
                          fit: BoxFit.cover,
                          height: isSmallScreen ? 16 : 20, // Responsive icon size
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "Behance",
                          style: GoogleFonts.jost(
                            color: Colors.black,
                            fontSize: isSmallScreen ? 11 : 14, // Responsive font size
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              "Currently working on this app",
              style: GoogleFonts.jost(
                fontSize: isSmallScreen ? 10 : 12, // Responsive font size
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
