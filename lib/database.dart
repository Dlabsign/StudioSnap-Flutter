import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studiosnap/Auth/user.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'studiosnap.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user TEXT,
        nama TEXT,
        pass TEXT,
        tlpn INTEGER
      )
    ''');
  }

  Future<int> insertUser(Users user) async {
    Database db = await database;
    int result = await db.insert('users', user.toMap());

    // Log data pengguna yang baru disimpan
    print('User inserted: ${user.toMap()} with ID: $result');

    return result;
  }

  Future<Users?> getUserByEmail(String email) async {
    Database db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('users', where: 'email = ?', whereArgs: [email]);

    if (maps.isNotEmpty) {
      return Users.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Users>> getAllUsers() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return Users.fromMap(maps[i]);
    });
  }

  Future<int> updateUser(Users user) async {
    Database db = await database;
    return await db.update('users', user.toMap(),
        where: 'email = ?', whereArgs: [user.email]);
  }

  Future<int> deleteUser(String email) async {
    Database db = await database;
    return await db.delete('users', where: 'email = ?', whereArgs: [email]);
  }

  Future<void> saveUsersToTxt(BuildContext context) async {
    try {
      List<Users> users = await getAllUsers();

      if (users.isEmpty) {
        print('No users found to save.');
        return;
      }

      StringBuffer sb = StringBuffer();
      for (var user in users) {
        sb.writeln('User: ${user.user}');
        sb.writeln('Nama: ${user.nama}');
        sb.writeln('Password: ${user.pass}');
        sb.writeln('Telepon: ${user.tlpn}');
        sb.writeln('------------------------');
      }

      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/data.txt';
      final file = File(path);

      print('Saving to file path: $path');

      await file.writeAsString(sb.toString());

      final fileContents = await file.readAsString();
      print('File contents:\n$fileContents');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data berhasil disimpan ke $path'),
          duration: Duration(seconds: 5),
          backgroundColor: Color.fromARGB(255, 32, 142, 36),
        ),
      );
    } catch (e) {
      print('Error saving users to TXT: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving users to TXT: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
