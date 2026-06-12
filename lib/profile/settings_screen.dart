import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.language),
              title: Text("Language"),
              subtitle: Text("English"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
              subtitle: Text("On"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About App"),
              subtitle: Text("Education App"),
            ),
          ],
        ),
      ),
    );
  }
}