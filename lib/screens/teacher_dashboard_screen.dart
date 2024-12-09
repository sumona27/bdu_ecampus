import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'login_screen.dart';

class TeacherDashboardScreen extends StatefulWidget {
  const TeacherDashboardScreen({Key? key}) : super(key: key);

  @override
  _TeacherDashboardScreenState createState() => _TeacherDashboardScreenState();
}

class _TeacherDashboardScreenState extends State<TeacherDashboardScreen> {
  String _teacherName = '';

  @override
  void initState() {
    super.initState();
    _loadTeacherName();
  }

  Future<void> _loadTeacherName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _teacherName = prefs.getString('name') ?? 'Teacher';
    });
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAll(() => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Dashboard'),
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 35, color: Colors.blue),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _teacherName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    'Teacher',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.class_),
              title: const Text('My Courses'),
              onTap: () {
                // TODO: Implement courses view
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Assignments'),
              onTap: () {
                // TODO: Implement assignments view
              },
            ),
            ListTile(
              leading: const Icon(Icons.grade),
              title: const Text('Grade Students'),
              onTap: () {
                // TODO: Implement grading system
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // TODO: Implement settings
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          _buildDashboardCard(
            icon: Icons.class_,
            title: 'My Courses',
            color: Colors.blue,
            onTap: () {},
          ),
          _buildDashboardCard(
            icon: Icons.assignment,
            title: 'Assignments',
            color: Colors.green,
            onTap: () {},
          ),
          _buildDashboardCard(
            icon: Icons.grade,
            title: 'Grade Students',
            color: Colors.orange,
            onTap: () {},
          ),
          _buildDashboardCard(
            icon: Icons.people,
            title: 'Student List',
            color: Colors.purple,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: color,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
