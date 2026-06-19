import 'package:education_app/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/helpers/shared_preferences_helper.dart';
import 'features/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options:
    DefaultFirebaseOptions.currentPlatform,
  );

  await SharedPreferencesHelper.init();

  runApp(MyApp());
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

      theme:
      isDark
          ? ThemeData.dark()
          : ThemeData.light(),

      home: DashboardScreen(
        // toggleTheme: toggleTheme,
      ),
    );
  }
}