import 'package:flutter/material.dart';
import 'package:studiosnap/screens/splash/welcomescreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: LogoScreen()),
    );
  }
}