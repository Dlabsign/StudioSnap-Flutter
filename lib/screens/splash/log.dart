import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiosnap/components/spbutton.dart';
import 'package:studiosnap/Auth/login.dart';
import 'package:studiosnap/Auth/signup.dart';

class LogPage extends StatelessWidget {
  const LogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: Colors.black38),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/image/splash/splashscreen_img.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ],
              )),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Kamu Sudah Punya Akun?",
                        style: GoogleFonts.jost(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                          letterSpacing: 0.36,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "StudioSnap",
                        style: GoogleFonts.jost(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          height: 1.4,
                          letterSpacing: 0.36,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SPButton(
                      text: "Masuk",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Kalo belum daftar dulu ya",
                      style: GoogleFonts.jost(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.36,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SPButton(
                        text: "Daftar",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()),
                          );
                        }),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
