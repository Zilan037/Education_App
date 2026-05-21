import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/constants/app_color.dart';
import '../core/widgets/app_button.dart';
import '../core/widgets/app_text_field.dart';
import '../core/widgets/app_snackbar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {

  final emailController = TextEditingController();

  bool isLoading = false;

  void resetPassword() async {
    if (emailController.text.isEmpty) {
      AppSnackBar.show(context, "Enter your email");
      return;
    }

    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() => isLoading = false);

    AppSnackBar.show(
      context,
      "Reset link sent to email",
    );
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

                  const Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),

                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 20,
                        sigmaY: 20,
                      ),

                      child: Container(
                        padding: const EdgeInsets.all(22),

                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.22),
                              Colors.white.withOpacity(0.10),
                            ],
                          ),

                          borderRadius:
                          BorderRadius.circular(25),

                          border: Border.all(
                            color: Colors.white.withOpacity(0.25),
                          ),
                        ),

                        child: Column(
                          children: [

                            AppTextField(
                              controller: emailController,
                              hint: "Enter email",
                              icon: Icons.email,
                              textColor: Colors.white,
                            ),

                            const SizedBox(height: 20),

                            AppButton(
                              text: "Send Reset Link",
                              isLoading: isLoading,
                              onPressed: resetPassword,
                            ),

                            const SizedBox(height: 15),

                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Back to Login",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}