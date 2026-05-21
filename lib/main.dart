import 'package:flutter/material.dart';
import 'package:education_app/features/login_screen.dart';
import 'package:education_app/features/register_screen.dart';

import 'features/forgot_password.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/register',

      routes: {
        '/register': (context) => const RegisterScreen(),
        '/': (context) => LoginScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),

      },
    );
  }
}
