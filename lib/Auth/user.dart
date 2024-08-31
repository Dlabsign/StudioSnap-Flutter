//     final users = usersFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Users usersFromMap(String str) => Users.fromMap(json.decode(str));

String usersToMap(Users data) => json.encode(data.toMap());

class Users {
  final String user;
  final String nama;
  final String email;
  final String pass;
  final int tlpn;

  Users({
    required this.user,
    required this.nama,
    required this.email,
    required this.pass,
    required this.tlpn,
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        user: json["user"],
        nama: json["nama"],
        email: json["email"],
        pass: json["pass"],
        tlpn: json["tlpn"],
      );

  Map<String, dynamic> toMap() => {
        "user": user,
        "nama": nama,
        "email": email,
        "pass": pass,
        "tlpn": tlpn,
      };
}
