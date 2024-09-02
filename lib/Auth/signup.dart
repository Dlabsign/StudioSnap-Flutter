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
        user: UserEmail.text, // Atau user ID yang unik
        nama: UserNama.text,
        email: UserEmail.text,
        pass: UserPassword.text,
        tlpn: int.parse(UserTlpn.text),
      );

      // Simpan data pengguna ke database
      await dbHelper.insertUser(newUser);
      // Log semua data pengguna yang ada di database
      List<Users> allUsers = await dbHelper.getAllUsers();
      allUsers.forEach((user) {
        print('User: ${user.toMap()}');
      });

      // Simpan data pengguna ke file JSON
      await dbHelper.saveUsersToTxt(context);

      // Navigasi ke halaman login setelah berhasil menyimpan data
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
          bottom:
              BorderSide(width: 1.2, color: Color.fromARGB(255, 101, 101, 101)),
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
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          children: [
                            Text(
                              "Capture Your Moment With",
                              style: GoogleFonts.jost(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.24,
                              ),
                            ),
                            Text(
                              "StudioSnap",
                              style: GoogleFonts.jost(
                                color: Colors.black,
                                fontSize: 46,
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
                            label: 'Nomor Telepon',
                            placeholder: "Masukkan Nomor Telepon",
                            controller: UserTlpn,
                          ),
                          const SizedBox(height: 25),
                          InputComp(
                            label: 'Masukkan kata sandi',
                            placeholder: "Masukkan Password Kamu",
                            pass: true,
                            controller: UserPassword,
                          ),
                          const SizedBox(height: 25),
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
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    SPButton(
                      text: "Daftar",
                      onPressed: saveUser,
                    ),
                    Opacity(
                      opacity: 0.70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Sudah mempunyai Akun?",
                            style: GoogleFonts.jost(
                              color: Colors.black,
                              fontSize: 12,
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
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.jost(
                                color: Colors.black87,
                                fontSize: 12,
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
