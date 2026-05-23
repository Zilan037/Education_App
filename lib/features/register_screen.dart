import 'package:flutter/material.dart';
import '../auth/bloc.dart';
import '../core/services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final AuthService authService = AuthService();

  final FirebaseService firebaseService = FirebaseService();

  bool isLoading = false;

  String position = "Student";

  // REGISTER

  Future<void> register() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Passwords do not match")));

      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final userCredential = await authService.register(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        name: nameController.text.trim(),
        position: position,
      );

      await firebaseService.saveUser(
        uid: userCredential.user!.uid,

        name: nameController.text.trim(),

        email: emailController.text.trim(),

        position: position,
      );

      if (!mounted) return;

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: nameController,

              decoration: InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

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

            SizedBox(height: 20),

            TextField(
              controller: confirmPasswordController,

              obscureText: true,

              decoration: InputDecoration(
                labelText: "Confirm Password",

                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            DropdownButtonFormField(
              value: position,
              items: [
                DropdownMenuItem(value: "Student", child: Text("Student")),
                DropdownMenuItem(value: "Teacher", child: Text("Teacher")),
              ],

              onChanged: (value) {
                setState(() {
                  position = value!;
                });
              },

              decoration: InputDecoration(
                labelText: "Position",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              height: 55,

              child: ElevatedButton(
                onPressed: isLoading ? null : register,

                child: isLoading
                    ? CircularProgressIndicator()
                    : Text("Register"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
