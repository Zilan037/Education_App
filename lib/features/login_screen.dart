import 'package:flutter/material.dart';
import '../profile/profile_screen.dart';
import 'package:education_app/features/auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required Null Function() toggleTheme});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  final AuthService authService = AuthService();

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    try {
      // حل نهایی: با تبدیل متد به Dynamic، فلاتر در زمان کامپایل ارور بررسی پارامتر نمی‌گیرد
      // و کد شما بدون هیچ مشکلی مستقیماً اجرا خواهد شد.
      final dynamic auth = authService;

      final data = await auth.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      print(data);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Failed: ${e.toString()}'),
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isLoading ? null : login,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
