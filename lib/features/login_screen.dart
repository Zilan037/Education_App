// import 'package:education_app/features/register_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:education_app/features/auth_services.dart';
// import '../profile/profile_screen.dart';
// import 'package:education_app/core/constants/theme.dart';
//
// class LoginScreen extends StatefulWidget {
//   final VoidCallback toggleTheme;
//
//   const LoginScreen({
//     super.key,
//     required this.toggleTheme,
//   });
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   bool isLoading = false;
//
//   final AuthService authService = AuthService();
//
//   Future<void> login() async {
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       final dynamic auth = authService;
//
//       final data = await auth.login(
//         emailController.text.trim(),
//         passwordController.text.trim(),
//       );
//
//       print(data);
//
//       if (!mounted) return;
//
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (_) => const ProfileScreen(),
//         ),
//       );
//     } catch (e) {
//       if (!mounted) return;
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             'Login Failed: ${e.toString()}',
//           ),
//         ),
//       );
//     }
//
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Login",
//           style: theme.textTheme.titleLarge,
//         ),
//         actions: [
//           IconButton(
//             onPressed: widget.toggleTheme,
//             icon: const Icon(Icons.dark_mode_rounded),
//           ),
//         ],
//       ),
//
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 Text(
//                   "Welcome Back ",
//                   style: theme.textTheme.headlineMedium,
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 Text(
//                   "Login to continue your learning journey.",
//                   style: theme.textTheme.bodyMedium,
//                 ),
//
//                 const SizedBox(height: 40),
//
//                 Text(
//                   "Email",
//                   style: theme.textTheme.titleMedium,
//                 ),
//
//                 const SizedBox(height: 12),
//
//                 TextField(
//                   controller: emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   style: theme.textTheme.bodyLarge,
//                   decoration: const InputDecoration(
//                     hintText: "Enter your email",
//                     prefixIcon: Icon(Icons.email_outlined),
//                   ),
//                 ),
//
//                 const SizedBox(height: 24),
//
//                 Text(
//                   "Password",
//                   style: theme.textTheme.titleMedium,
//                 ),
//
//                 const SizedBox(height: 12),
//
//                 TextField(
//                   controller: passwordController,
//                   obscureText: true,
//                   style: theme.textTheme.bodyLarge,
//                   decoration: const InputDecoration(
//                     hintText: "Enter your password",
//                     prefixIcon: Icon(Icons.lock_outline),
//                   ),
//                 ),
//
//                 const SizedBox(height: 16),
//
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {},
//                     child: const Text("Forgot Password?"),
//                   ),
//                 ),
//
//                 const SizedBox(height: 24),
//
//                 SizedBox(
//                   width: double.infinity,
//                   height: 56,
//                   child: ElevatedButton(
//                     onPressed:
//                     isLoading
//                         ? null
//                         : login,
//                     child:
//                     isLoading
//                         ? const SizedBox(
//                       height: 24,
//                       width: 24,
//                       child: CircularProgressIndicator(
//                         strokeWidth: 2.5,
//                         color: Colors.white,
//                       ),
//                     )
//                         : const Text("Login"),
//                   ),
//                 ),
//
//                 const SizedBox(height: 30),
//
//                 Row(
//                   children: [
//                     const Expanded(
//                       child: Divider(),
//                     ),
//
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                       ),
//                       child: Text(
//                         "OR",
//                         style: theme.textTheme.bodySmall,
//                       ),
//                     ),
//
//                     const Expanded(
//                       child: Divider(),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 30),
//
//                 SizedBox(
//                   width: double.infinity,
//                   height: 56,
//                   child: OutlinedButton.icon(
//                     onPressed: () {},
//                     icon: const Icon(Icons.g_mobiledata),
//                     label: const Text("Continue with Google"),
//                     style: OutlinedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 40),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don’t have an account? ",
//                       style: theme.textTheme.bodyMedium,
//                     ),
//
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const RegisterScreen(),
//                           ),
//                         );
//                       },
//                       child: const Text("Register"),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }