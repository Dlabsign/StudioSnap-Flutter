import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiosnap/components/spbutton.dart';
import 'package:studiosnap/screens/home/comp/headline-desc.dart';
import 'package:studiosnap/screens/home/comp/photocard.dart';

class selfPhotoPage extends StatefulWidget {
  const selfPhotoPage({super.key});

  @override
  State<selfPhotoPage> createState() => _selfPhotoPageState();
}

class _selfPhotoPageState extends State<selfPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Container(
          width: double.infinity,
          child: Text(
            "Booking sekarang",
            style: GoogleFonts.jost(
              fontSize: 14,
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
          "Self Photo",
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
                Headline: "Capture the perfect shot of yourself with ease.",
                Desc:
                    "Dapatkan foto profil terbaikmu hanya dalam sekali jepretan! Kamera otomatis kami akan mengatur semuanya, sehingga Anda bisa fokus tampil percaya diri. Hasilnya? Foto berkualitas studio yang siap pakai untuk berbagai keperluan.",
              ),
            ),
            PhotoCard(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: AboutTitle(
                Desc:
                    "Maximum Occupancy: Up to 2 people per session. Time Limit: Each session is limited to 30 minutes. Cancellation Policy: Cancellations must be made at least 24 hours in advance to avoid a cancellation fee.",
                Headline: "Syarat dan Ketentuan",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
