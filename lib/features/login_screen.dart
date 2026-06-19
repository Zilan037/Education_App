import 'package:education_app/dashboard/dashboard_screen.dart';
import 'package:education_app/features/register_screen.dart';
import 'package:flutter/material.dart';
import '../auth/bloc.dart';
import '../profile/profile_screen.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const LoginScreen({super.key, required this.toggleTheme});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final AuthService authService = AuthService();

  bool isLoading = false;

  // LOGIN

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    try {
      await authService.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        username: '',
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ProfileScreen()),
      );
    } catch (error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.toString())));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),

        actions: [
          IconButton(
            onPressed: widget.toggleTheme,
            icon: Icon(Icons.dark_mode),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed: isLoading ? null : login,

                child: isLoading ? CircularProgressIndicator() : Text("Login"),
              ),
            ),

            SizedBox(height: 20),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,

                  MaterialPageRoute(builder: (_) => DashboardScreen()),
                );
              },

              child: Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}
