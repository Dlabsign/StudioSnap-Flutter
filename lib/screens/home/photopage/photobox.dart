import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiosnap/components/spbutton.dart';
import 'package:studiosnap/screens/booking/bookingpage.dart';
import 'package:studiosnap/screens/home/comp/headline-desc.dart';
import 'package:studiosnap/screens/home/comp/photocard.dart';

class PhotoBox extends StatefulWidget {
  final String userName;
  const PhotoBox({super.key, required this.userName});

  @override
  State<PhotoBox> createState() => PhotoBoxState();
}

class PhotoBoxState extends State<PhotoBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(18),
            backgroundColor: const Color(0xFF0404B2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BookingPageInt(
                  userName: widget.userName,
                ),
              ),
            );
          },
          child: Text(
            "Booking sekarang",
            style: GoogleFonts.jost(
              fontSize: 14,
              color: Colors.white,
              letterSpacing: 0.24,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F3F4),
        shape: const Border(
          bottom: BorderSide(
            width: 1.2,
            color: Color.fromARGB(255, 101, 101, 101),
          ),
        ),
        title: Text(
          "PhotoBox",
          style: GoogleFonts.jost(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            letterSpacing: 0.24,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: AboutTitle(
                Headline:
                    "Jadikan setiap acara tak terlupakan dengan foto instan yang menyenangkan.",
                Desc:
                    "Photo Booth kami dilengkapi dengan tema dan latar belakang yang dapat disesuaikan, menjadikannya tambahan sempurna untuk acara apapun. Para tamu dapat membawa pulang cetakan berkualitas tinggi sebagai kenang-kenangan yang menyenangkan.",
              ),
            ),
            PhotoCard(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: AboutTitle(
                Desc:
                    "Maximum Occupancy: Up to 6 people per photo.\nEvent Duration: The photo booth can be rented for a minimum of 2 hours.\nCustomization: Custom themes and backgrounds must be requested at least 7 days in advance.",
                Headline: "Syarat dan Ketentuan",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
