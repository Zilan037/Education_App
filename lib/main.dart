import 'package:flutter/material.dart';
import 'profile/profile_screen.dart';

void main() {
  runApp( education());
}

class education extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileScreen(),
    );
  }
}