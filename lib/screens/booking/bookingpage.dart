import 'package:flutter/material.dart';
import 'package:studiosnap/components/bottombar.dart';

class BookingPageInt extends StatefulWidget {
  final String userName;
  const BookingPageInt({super.key, required this.userName});

  @override
  State<BookingPageInt> createState() => _BookingPageIntState();
}

class _BookingPageIntState extends State<BookingPageInt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: BottomBar(
            userName: widget.userName,
            currentIndex: 1,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Booking Page"),
          ],
        ));
  }
}
