import 'package:flutter/material.dart';
import 'timetable_screen.dart'; // Import the homepage
import 'login_page.dart'; // Import the login page

void main() {
  runApp(TimetableApp());
}

class TimetableApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timetable Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Start with the login page
    );
  }
}
