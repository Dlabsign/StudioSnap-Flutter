import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiosnap/components/spbutton.dart';
import 'package:studiosnap/screens/booking/bookingpage.dart';
import 'package:studiosnap/screens/home/comp/headline-desc.dart';
import 'package:studiosnap/screens/home/comp/photocard.dart';

class EventPage extends StatefulWidget {
  final String userName;
  const EventPage({super.key, required this.userName});

  @override
  State<EventPage> createState() => EventPageState();
}

class EventPageState extends State<EventPage> {
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
          "Event Photo",
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
                Headline: "Abadikan setiap momen, dari awal hingga akhir.",
                Desc:
                    "Layanan Event Photography kami mencakup semua jenis acara, mulai dari pernikahan hingga seminar perusahaan. Fotografer profesional kami terampil dalam menangkap esensi acara Anda, memastikan tidak ada momen yang terlewatkan.",
              ),
            ),
            PhotoCard(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: AboutTitle(
                Desc:
                    "Booking Requirement: Must be booked at least 2 weeks in advance. \nDuration: A minimum booking of 4 hours is required.\nDeliverables: Includes up to 100 edited photos; additional photos can be requested for an extra fee.",
                Headline: "Syarat dan Ketentuan",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
