import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Progress"),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Learning Progress",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 25),

            Text("Completed Courses: 3"),
            SizedBox(height: 10),

            Text("Completed Quizzes: 5"),
            SizedBox(height: 10),

            Text("Overall Progress: 70%"),
            SizedBox(height: 20),

            LinearProgressIndicator(value: 0.7),
          ],
        ),
      ),
    );
  }
}