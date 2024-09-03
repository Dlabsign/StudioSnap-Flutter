import 'package:flutter/material.dart';
import 'package:studiosnap/components/bottombar.dart';
import 'package:studiosnap/screens/booking/calendar.dart';
import 'package:studiosnap/screens/home/comp/homeappbar.dart';

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
        appBar: HomeAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [CalendarWidget(userName: widget.userName)],
            ),
          ),
        ));
  }
}
