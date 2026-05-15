import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  static const Color orange = Color(0xFFFF8A00);
  static const Color darkOrange = Color(0xFFE86A00);
  static const Color lightBg = Color(0xFFFFF7F0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 35),



                Center(
                  child: Container(
                    height: 115,
                    width: 115,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: orange.withOpacity(0.25),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),


                    child: const Icon(
                      Icons.school_rounded,
                      size: 62,
                      color: orange,
                    ),
                  ),
                ),




                const SizedBox(height: 35),

                const Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D2D2D),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Login to continue learning",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 40),

                _inputField(
                  label: "Username",
                  icon: Icons.person_outline,
                ),

                const SizedBox(height: 18),



                _inputField(
                  label: "Password",
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orange,
                      foregroundColor: Colors.white,
                      elevation: 4,


                      shadowColor: orange.withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      "Login",

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),


                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Don't have an account? Register",
                      style: TextStyle(
                        color: darkOrange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField({
    required String label,
    required IconData icon,
    bool obscureText = false,
  }) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.12),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: orange),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black54),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 18,
          ),
        ),
      ),
    );
  }
}