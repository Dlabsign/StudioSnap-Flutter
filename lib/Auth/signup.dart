import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiosnap/Auth/user.dart';
import 'package:studiosnap/components/input.dart';
import 'package:studiosnap/components/spbutton.dart';
import 'package:studiosnap/Auth/login.dart';
import 'package:studiosnap/database.dart'; // Import DatabaseHelper

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final UserNama = TextEditingController();
  final UserEmail = TextEditingController();
  final UserPassword = TextEditingController();
  final ConfirmPassword = TextEditingController();
  final UserTlpn = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final dbHelper = DatabaseHelper();

  Future<void> saveUser() async {
    if (formKey.currentState?.validate() ?? false) {
      final newUser = Users(
        user: UserEmail.text,
        nama: UserEmail.text,
        email: UserEmail.text,
        pass: UserPassword.text,
        tlpn: int.parse(UserTlpn.text),
      );

      await dbHelper.insertUser(newUser);
      List<Users> allUsers = await dbHelper.getAllUsers();
      allUsers.forEach((user) {
        print('User: ${user.toMap()}');
      });

      await dbHelper.saveUsersToTxt(context);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F3F4),
        shape: const Border(
          bottom: BorderSide(width: 1.2, color: Color.fromARGB(255, 101, 101, 101)),
        ),
        title: Text(
          "Sign Up",
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
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: MediaQuery.of(context).size.height * 0.05),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.03),
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
                InputComp(
                  label: 'Username',
                  placeholder: "Masukkan Username",
                  controller: UserEmail,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                InputComp(
                  label: 'Nomor Telepon',
                  placeholder: "Masukkan Nomor Telepon",
                  controller: UserTlpn,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                InputComp(
                  label: 'Masukkan kata sandi',
                  placeholder: "Masukkan Password Kamu",
                  pass: true,
                  controller: UserPassword,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                InputComp(
                  label: 'Konfirmasi kata sandi',
                  placeholder: "Masukkan kembali kata sandi",
                  pass: true,
                  controller: ConfirmPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password tidak boleh kosong";
                    } else if (value != UserPassword.text) {
                      return "Password tidak cocok";
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                SPButton(
                  text: "Daftar",
                  onPressed: saveUser,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Opacity(
                  opacity: 0.70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah mempunyai Akun?",
                        style: GoogleFonts.jost(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.36,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.jost(
                            color: Colors.black87,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 0.36,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
