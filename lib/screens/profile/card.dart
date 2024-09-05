import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiosnap/database.dart';

class ProfileCard extends StatefulWidget {
  final String userName;
  const ProfileCard({super.key, required this.userName});

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  String? phoneNumber;
  final dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    final user = await dbHelper.getUserByEmail(widget.userName);
    if (user != null) {
      setState(() {
        phoneNumber = user.tlpn.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Color(0xFF0404B2),
        borderRadius: BorderRadius.all(Radius.circular(17)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "UserName:",
                style: GoogleFonts.jost(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFE9FC50)),
              ),
              Text(
                widget.userName.toUpperCase(),
                style: GoogleFonts.jost(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFE9FC50),
                  letterSpacing: 0.50,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Nomor Telepon:",
                style: GoogleFonts.jost(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFE9FC50)),
              ),
              Text(
                phoneNumber ?? 'Loading...',
                style: GoogleFonts.jost(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFE9FC50),
                  letterSpacing: 0.50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
