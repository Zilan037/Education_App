import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color orange = Color(0xFFFF8A00);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.person,
              size: 100,
              color: orange,
            ),


            const SizedBox(height: 20),

            const Text(
              "Zeynab Nazarii",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(

              "Flutter Developer",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            _infoRow(Icons.email, "zeynab@gmail.com"),
            const SizedBox(height: 15),


            _infoRow(Icons.phone, "+971 000000000"),
            const SizedBox(height: 15),


            _infoRow(Icons.school, "University of Kabul"),
            const SizedBox(height: 25),


            const Divider(),
            const ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text("My Progress"),
            ),

            const Divider(),

            const ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favorites"),
            ),
            const Divider(),

            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),

            const Divider(),

            const ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),

            const Divider(),


            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ),
                  );
                },
                child: const Text("Edit Profile"),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }


  static Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: orange),
        const SizedBox(width: 15),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}