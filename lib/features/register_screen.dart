import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:education_app/core/widgets/app_button.dart';
import 'package:education_app/core/widgets/app_text_field.dart';
import 'package:education_app/core/widgets/app_snackbar.dart';
import 'package:education_app/core/constants/app_strings.dart';
import 'package:education_app/features/auth_services.dart';

import '../core/constants/app_color.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  String role = "student";
  bool isLoading = false;
  bool obscurePass = true;
  bool obscureConfirm = true;

  void register() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmController.text.isEmpty) {
      AppSnackBar.show(context, AppStrings.fillFields);
      return;
    }

    if (passwordController.text != confirmController.text) {
      AppSnackBar.show(context, "Passwords do not match");
      return;
    }

    setState(() => isLoading = true);

    try {
      final auth = AuthService();

      final user = await auth.register(
        nameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
        role,
      );

      if (!mounted) return;

      if (user != null) {

        AppSnackBar.show(context, "Account created successfully");

        Navigator.pop(context);
      } else {
        AppSnackBar.show(context, "Registration failed");
      }
    } catch (e) {
      AppSnackBar.show(context, "Error occurred");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "Create Account ✨",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  _card(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _card() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.22),
                Colors.white.withOpacity(0.10),
                Colors.white.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white.withOpacity(0.25)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.20),
                blurRadius: 25,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            children: [
              AppTextField(
                controller: nameController,
                hint: "Full Name",
                icon: Icons.person,
                textColor: Colors.white,
              ),

              const SizedBox(height: 12),

              AppTextField(
                controller: emailController,
                hint: "Email",
                icon: Icons.email,
                textColor: Colors.white,
              ),

              const SizedBox(height: 12),

              AppTextField(
                controller: passwordController,
                hint: "Password",
                icon: Icons.lock,
                obscure: obscurePass,
                textColor: Colors.white,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePass ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    setState(() => obscurePass = !obscurePass);
                  },
                ),
              ),

              const SizedBox(height: 12),

              AppTextField(
                controller: confirmController,
                hint: "Confirm Password",
                icon: Icons.lock_outline,
                obscure: obscureConfirm,
                textColor: Colors.white,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureConfirm ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    setState(() => obscureConfirm = !obscureConfirm);
                  },
                ),
              ),

              const SizedBox(height: 12),

              DropdownButtonFormField(
                value: role,
                dropdownColor: Colors.black87,
                style: const TextStyle(color: Colors.white),
                items: const [
                  DropdownMenuItem(value: "student", child: Text("Student")),
                  DropdownMenuItem(value: "teacher", child: Text("Teacher")),
                  DropdownMenuItem(value: "academy", child: Text("Academy")),
                ],
                onChanged: (v) {
                  if (v != null) {
                    setState(() => role = v);
                  }
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.school, color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              AppButton(
                text: "Create Account",
                isLoading: isLoading,
                onPressed: register,
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Already have an account? Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}