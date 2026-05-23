import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:education_app/core/constants/app_color.dart';
import '../core/constants/app_strings.dart';
import '../core/widgets/app_button.dart';
import '../core/widgets/app_text_field.dart';
import '../core/widgets/app_snackbar.dart';
import 'package:education_app/features/auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool obscure = true;

  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      AppSnackBar.show(context, AppStrings.fillFields);
      return;
    }

    setState(() => isLoading = true);

    try {
      final auth = AuthService();

      final user = await auth.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (!mounted) return;

      if (user != null) {
        AppSnackBar.show(context, "Login successful");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(
                child: Text("Home Screen (coming soon)"),
              ),
            ),
          ),
        );
      } else {
        AppSnackBar.show(context, "Invalid login");
      }
    } catch (e) {
      AppSnackBar.show(context, "Login failed");
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
            colors: [
              AppColors.primary,
              AppColors.secondary,
            ],
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
                  Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/img.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const Text(
                    "Welcome Back 👋",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

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
          ),
          child: Column(
            children: [
              AppTextField(
                controller: emailController,
                hint: "Email",
                icon: Icons.email,
                textColor: Colors.white,
              ),

              const SizedBox(height: 15),

              AppTextField(
                controller: passwordController,
                hint: "Password",
                icon: Icons.lock,
                obscure: obscure,
                textColor: Colors.white,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    setState(() => obscure = !obscure);
                  },
                ),
              ),

              const SizedBox(height: 20),

              AppButton(
                text: "Login",
                isLoading: isLoading,
                onPressed: login,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/forgot-password',
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text(
                  "No account? Create one",
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