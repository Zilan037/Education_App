import 'package:education_app/quiz/quiz_model.dart';
import 'package:flutter/material.dart';
import '../features/login_screen.dart';
import 'dashboard_services.dart';
import '../profile/profile_screen.dart';
import '../courses/course_screen.dart';
import '../quiz/quiz_screen.dart';

class DashboardScreen extends StatefulWidget {
  static String id='dashboard_screen';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardService service = DashboardService();

  int courses = 0;
  int assignments = 0;
  int messages = 0;
  int quiz = 0;

  bool isLoading = true;

  String name = "";
  String role = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final userId = "userId123";
    // یا از FirebaseAuth
    final c = await service.getCoursesCount(userId);
    final a = await service.getAssignmentsCount(userId);
    final m = await service.getMessagesCount(userId);
    final user = await service.getUserInfo(userId);
    setState(() {
      courses = c;
      assignments = a;
      messages = m;

      name = user['name'];
      role = user['role'];

      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"), centerTitle: true),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome $name 👋",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            Text("Role: $role", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: [
                  _card(
                    title: "Courses",
                    value: courses.toString(),
                    icon: Icons.school,onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => CourseScreen()),);
                  }
                  ),
                  _card(
                      title: "Quiz",
                      value: quiz.toString(),
                      icon: Icons.question_mark,onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => QuizScreen(exam: ExamModel(id: '', title: '', subject: '', questions: []),)),);
                  }
                  ),
                  _card(
                      title: "Login",
                      value: courses.toString(),
                      icon: Icons.start,onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>  LoginScreen()));
                  }
                  ),
                  _card(
                    title: "Assignments",
                    value: assignments.toString(),
                    icon: Icons.assignment,
                  ),

                  _card(
                    title: "Messages",
                    value: messages.toString(),
                    icon: Icons.message,
                  ),
                  _card(title: "Profile", value: "", icon: Icons.person,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),),);
                      }),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card({
    required String title,
    required String value,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.orange),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}