import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'settings_screen.dart';
import 'progress_screen.dart';
import 'favorites_screen.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    try {
      final result = await ApiService.getUser();

      setState(() {
        user = result;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : user == null
          ? Center(child: Text("No User Found"))
          : Padding(
              padding: const EdgeInsets.all(24),

              child: Column(
                children: [
                  SizedBox(height: 10),

                  CircleAvatar(radius: 60, child: Icon(Icons.person, size: 60)),

                  SizedBox(height: 20),

                  Text(
                    user!.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 10),

                  Text(user!.email),

                  SizedBox(height: 30),

                  _profileTile(
                    icon: Icons.email,
                    title: "Email",
                    subtitle: user!.email,
                  ),
                  SizedBox(height: 20),
                  _profileTile(
                    icon: Icons.person,
                    title: "Username",
                    subtitle: user!.name,
                  ),
                ],
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

  static Widget _profileTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle),
            ],
          ),
        ],
      ),
    );
  }
}
