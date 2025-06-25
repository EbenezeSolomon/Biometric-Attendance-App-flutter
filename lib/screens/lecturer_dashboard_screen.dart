import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LecturerDashboardScreen extends StatelessWidget {
  const LecturerDashboardScreen({super.key});

  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lecturer Dashboard'), actions: [
        IconButton(icon: Icon(Icons.logout), onPressed: () => _logout(context))
      ]),
      body: ListView(
        children: [
          ListTile(title: Text('Enroll Student'), onTap: () => Navigator.pushNamed(context, '/enroll')),
          ListTile(title: Text('Create Course'), onTap: () => Navigator.pushNamed(context, '/create_course')),
          ListTile(title: Text('Take Attendance'), onTap: () => Navigator.pushNamed(context, '/attendance')),
          ListTile(title: Text('View Attendance Logs'), onTap: () => Navigator.pushNamed(context, '/logs')),
        ],
      ),
    );
  }
}
