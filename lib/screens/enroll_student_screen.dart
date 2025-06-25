import 'package:flutter/material.dart';

class EnrollStudentScreen extends StatelessWidget {
  final TextEditingController id = TextEditingController();
  final TextEditingController name = TextEditingController();

  EnrollStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enroll Student')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: id, decoration: InputDecoration(labelText: 'Student ID')),
            TextField(controller: name, decoration: InputDecoration(labelText: 'Name')),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Enroll'),
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Student Enrolled'))),
            )
          ],
        ),
      ),
    );
  }
}
