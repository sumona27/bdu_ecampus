import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // TODO: Implement profile
            },
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 35, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Student',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Courses'),
              onTap: () {
                // TODO: Navigate to courses
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Schedule'),
              onTap: () {
                // TODO: Navigate to schedule
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Assignments'),
              onTap: () {
                // TODO: Navigate to assignments
              },
            ),
            ListTile(
              leading: const Icon(Icons.grade),
              title: const Text('Grades'),
              onTap: () {
                // TODO: Navigate to grades
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // TODO: Navigate to settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // TODO: Implement logout
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
            icon: Icons.book,
            title: 'Courses',
            color: Colors.blue,
            onTap: () {},
          ),
          _buildDashboardCard(
            icon: Icons.calendar_today,
            title: 'Schedule',
            color: Colors.green,
            onTap: () {},
          ),
          _buildDashboardCard(
            icon: Icons.assignment,
            title: 'Assignments',
            color: Colors.orange,
            onTap: () {},
          ),
          _buildDashboardCard(
            icon: Icons.grade,
            title: 'Grades',
            color: Colors.purple,
            onTap: () {},
          ),
          _buildDashboardCard(
            icon: Icons.notifications,
            title: 'Notifications',
            color: Colors.red,
            onTap: () {},
          ),
          _buildDashboardCard(
            icon: Icons.person,
            title: 'Profile',
            color: Colors.teal,
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
