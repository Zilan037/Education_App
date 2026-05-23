import 'package:flutter/material.dart';
import '../auth/api_service.dart';
import '../auth/user_models.dart';

class ProfileScreen extends StatefulWidget {
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
