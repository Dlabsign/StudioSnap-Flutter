import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiosnap/components/input.dart';
import 'package:studiosnap/components/spbutton.dart';
import 'package:studiosnap/Auth/signup.dart';
import 'package:studiosnap/database.dart';
import 'package:studiosnap/screens/home/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UserEmail = TextEditingController();
  final UserPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final dbHelper = DatabaseHelper();

  Future<void> loginUser() async {
    if (formKey.currentState?.validate() ?? false) {
      final user = await dbHelper.getUserByEmail(UserEmail.text);

      if (user != null && user.pass == UserPassword.text) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                  userName: UserEmail.text)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email atau Password Salah!'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F3F4),
        shape: const Border(
          bottom: BorderSide(
            width: 1.2,
            color: Color.fromARGB(255, 101, 101, 101),
          ),
        ),
        title: Text(
          "Login",
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.05),
                        child: Column(
                          children: [
                            Text(
                              "Capture Your Moment With",
                              style: GoogleFonts.jost(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width * 0.04,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.24,
                              ),
                            ),
                            Text(
                              "StudioSnap",
                              style: GoogleFonts.jost(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width * 0.1,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputComp(
                            label: 'Username',
                            placeholder: "Masukkan Username",
                            controller: UserEmail,
                          ),
                          const SizedBox(height: 25),
                          InputComp(
                            label: 'Password',
                            placeholder: "Masukkan Password Kamu",
                            controller: UserPassword,
                            pass: true,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Lupa Password?",
                              style: GoogleFonts.jost(
                                color: const Color(0xFF555555),
                                fontSize: MediaQuery.of(context).size.width * 0.03,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Column(
                  children: [
                    SPButton(text: "Masuk", onPressed: loginUser),
                    const SizedBox(height: 15),
                    Opacity(
                      opacity: 0.70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Belum mempunyai Akun?",
                            style: GoogleFonts.jost(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width * 0.03,
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.36,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Buat Akun",
                              style: GoogleFonts.jost(
                                color: Colors.black87,
                                fontSize: MediaQuery.of(context).size.width * 0.03,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                height: 0,
                                letterSpacing: 0.36,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
