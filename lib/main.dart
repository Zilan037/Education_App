import 'package:education_app/quiz/create_exam_screen.dart';
import 'package:flutter/material.dart';
import 'package:education_app/core/constants/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,

      home: const TeacherCreateExamScreen(),
    );
  }
}