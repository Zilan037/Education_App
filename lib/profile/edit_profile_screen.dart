import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  static const Color orange = Color(0xFFFF8A00);
  static const Color lightBg = Color(0xFFFFF7F0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: orange.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(
                Icons.person,
                size: 70,
                color: orange,
              ),
            ),

            const SizedBox(height: 12),

            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_outlined, color: orange),
              label: const Text(
                "Change Photo",
                style: TextStyle(color: orange),
              ),
            ),

            const SizedBox(height: 25),

            _inputField(
              label: "Full Name",
              icon: Icons.person_outline,
              initialValue: "Zeynab Nazari",
            ),

            const SizedBox(height: 18),

            _inputField(
              label: "Email",
              icon: Icons.email_outlined,
              initialValue: "zeynab@gmail.com",
            ),

            const SizedBox(height: 18),

            _inputField(
              label: "Phone Number",
              icon: Icons.phone_outlined,
              initialValue: "+971 000000000",
            ),

            const SizedBox(height: 18),

            _inputField(
              label: "University",
              icon: Icons.school_outlined,
              initialValue: "University of Kabul",
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  "Save Changes",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _inputField({
    required String label,
    required IconData icon,
    required String initialValue,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: orange),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}