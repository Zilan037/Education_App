import 'package:education_app/courses/course_bloc.dart';
import 'package:education_app/dashboard/dashboard_screen.dart';
import 'package:education_app/features/register_screen.dart';
import 'package:provider/provider.dart';
import 'core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/helpers/shared_preferences_helper.dart';
import 'features/login_screen.dart';
import 'firebase_options.dart';
import '';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await SharedPreferencesHelper.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CourseBloc(),),
    ],

  child:  MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  void toggleTheme() {
    setState(() {
      isDark = !isDark;

      SharedPreferencesHelper.setBool("isDark", isDark);
    });
  }

  @override
  void initState() {
    super.initState();

    isDark = SharedPreferencesHelper.getBool("isDark") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      routes: {
        'login_screen': (context) => LoginScreen(toggleTheme: toggleTheme),
        'register_screen': (context) => RegisterScreen(Theme: () {  },),
        'dashboard_screen': (context) => DashboardScreen(),
      },
      initialRoute: 'dashboard_screen',
    );
  }
}
