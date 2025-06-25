import 'package:flutter/material.dart';

class AttendanceLogScreen extends StatelessWidget {
  static const List<Map<String, String>> logs = [
    {'id': 'TSU001', 'name': 'John Doe', 'action': 'sign_in', 'time': '2025-06-18 10:00'},
    {'id': 'TSU001', 'name': 'John Doe', 'action': 'sign_out', 'time': '2025-06-18 12:00'},
  ];

  const AttendanceLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Attendance Logs')),
      body: ListView.builder(
        itemCount: logs.length,
        itemBuilder: (context, index) {
          final log = logs[index];
          return ListTile(
            title: Text('${log['name']} (${log['id']})'),
            subtitle: Text('${log['action']} @ ${log['time']}'),
          );
        },
      ),
    );
  }
}
