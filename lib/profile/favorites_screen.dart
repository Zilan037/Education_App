import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.book),
              title: Text("Flutter Basics"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.code),
              title: Text("Dart OOP"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.quiz),
              title: Text("Quiz App"),
            ),
          ],
        ),
      ),
    );
  }
}