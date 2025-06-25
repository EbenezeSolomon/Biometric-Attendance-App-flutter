import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  final TextEditingController id = TextEditingController();
  final TextEditingController course = TextEditingController();

  AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take Attendance')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: id, decoration: InputDecoration(labelText: 'Student ID')),
            TextField(controller: course, decoration: InputDecoration(labelText: 'Course Code')),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: () {
                // Placeholder for sign-in logic and biometric authentication
                // Implement actual sign-in and biometric logic here
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signed In')));
              },
            ),
            ElevatedButton(
              child: Text('Sign Out'),
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signed Out'))),
            )
          ],
        ),
      ),
    );
  }
}
