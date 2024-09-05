import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoCard extends StatelessWidget {
  final List<String> imgList = [
    'assets/image/self_photo/TJ1.jpg',
    'assets/image/self_photo/TJ2.jpg',
    'assets/image/self_photo/TJ3.jpg',
    'assets/image/self_photo/TJ4.jpg',
    'assets/image/self_photo/TJ5.jpg',
  ];

  PhotoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Our Gallery",
            style: GoogleFonts.jost(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.24,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CarouselSlider(
            items: imgList.map((e) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  image:
                      DecorationImage(image: AssetImage(e), fit: BoxFit.cover),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 250,
              autoPlay: true,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 700),
            ),
          ),
        ],
      ),
    );
  }
}
