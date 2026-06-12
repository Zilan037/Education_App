import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'settings_screen.dart';
import 'progress_screen.dart';
import 'favorites_screen.dart';
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


            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text("My Progress"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProgressScreen(),
                  ),
                );
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("Favorites"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoritesScreen(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Logout"),
                      content: const Text(
                        "Are you sure you want to logout?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Logout"),
                        ),
                      ],
                    );
                  },
                );
              },
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