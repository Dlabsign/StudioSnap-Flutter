import 'package:flutter/material.dart';
import 'package:studiosnap/screens/booking/bookingpage.dart';
import 'package:studiosnap/screens/home/homepage.dart';
import 'package:studiosnap/screens/profile/profilepage.dart';

class BottomBar extends StatelessWidget {
  final String userName;
  final int currentIndex; // Tambahkan ini untuk melacak halaman aktif

  const BottomBar({required this.userName, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 78,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xFF191716),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BottomBarItem(
            title: 'Home',
            isActive:
                currentIndex == 0, // Aktifkan jika halaman saat ini adalah Home
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(userName: userName),
                ),
              );
            },
          ),
          BottomBarItem(
            title: 'Booking',
            isActive: currentIndex ==
                1, // Aktifkan jika halaman saat ini adalah Booking
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => BookingPageInt(
                          userName: userName,
                        )),
              );
            },
          ),
          BottomBarItem(
            title: 'Profile',
            isActive: currentIndex ==
                2, // Aktifkan jika halaman saat ini adalah Profile
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(
                          userName: userName,
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const BottomBarItem({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFFE9FC50),
          fontSize: 12,
          fontFamily: 'Jost',
          fontWeight: isActive
              ? FontWeight.w700
              : FontWeight.w400, // Ubah gaya berdasarkan isActive
          letterSpacing: 0.36,
        ),
      ),
    );
  }
}
