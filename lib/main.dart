import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'profile_page.dart';
import 'saran_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Akhir TPM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        '/profile': (BuildContext context) => ProfilePage(),
        '/saran': (BuildContext context) => SaranPage(),
        '/login': (BuildContext context) => LoginPage(),
        '/home': (BuildContext context) => HomePage(),
      },
    );
  }
}
