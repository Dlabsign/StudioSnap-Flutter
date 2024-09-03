import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiosnap/components/spbutton.dart';
import 'package:studiosnap/screens/booking/bookingpage.dart';
import 'package:studiosnap/screens/home/comp/headline-desc.dart';
import 'package:studiosnap/screens/home/comp/photocard.dart';

class ProductPage extends StatefulWidget {
  final String userName;
  const ProductPage({super.key, required this.userName});

  @override
  State<ProductPage> createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
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
          "Product Photo",
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
                Headline: "Tampilkan produk Anda dengan gaya profesional.",
                Desc:
                    "Tingkatkan tampilan toko online atau katalog Anda dengan layanan Product Photography kami. Kami menyediakan pencahayaan dan styling yang ahli untuk memastikan produk Anda ditampilkan dalam kondisi terbaik, membantu Anda menarik dan mempertahankan pelanggan.",
              ),
            ),
            PhotoCard(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: AboutTitle(
                Desc:
                    "Product Limit: Up to 20 items per session.\nTime Limit: Sessions are available in 2-hour blocks.\nRevisions: One round of edits is included; additional edits may incur extra charges.",
                Headline: "Syarat dan Ketentuan",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
