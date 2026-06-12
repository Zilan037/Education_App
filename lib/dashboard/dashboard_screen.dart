import 'package:flutter/material.dart';
import 'dashboard_services.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardService service = DashboardService();

  int courses = 0;
  int assignments = 0;
  int messages = 0;

  bool isLoading = true;

  String name = "";
  String role = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final c = await service.getCoursesCount();
    final a = await service.getAssignmentsCount();
    final m = await service.getMessagesCount();
    final user = await service.getUserInfo();

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
                          icon: Icons.school,
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

                        _card(title: "Profile", value: "", icon: Icons.person),
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
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.orange),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
