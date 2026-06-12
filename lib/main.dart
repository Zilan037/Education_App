import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/constants/theme_app.dart';
import 'core/helpers/shared_preferences_helper.dart';
import 'features/login_screen.dart';
import 'firebase_options.dart';
import 'wrapper.dart';
import 'profile/profile_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options:
    DefaultFirebaseOptions.currentPlatform,
  );

  await SharedPreferencesHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() =>
      _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isDark = false;

  void toggleTheme() {

    setState(() {

      isDark = !isDark;

      SharedPreferencesHelper
          .setBool("isDark", isDark);
    });
  }

  @override
  void initState() {

    super.initState();

    isDark =
        SharedPreferencesHelper
            .getBool("isDark") ?? false;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode:
      isDark
          ? ThemeMode.dark
          : ThemeMode.light,
      home: const ProfileScreen(

      ),
    );
  }
}