import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biometric Attendance App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
        ),
      ),
      home: const AttendanceHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AttendanceHomePage extends StatefulWidget {
  const AttendanceHomePage({super.key});

  @override
  State<AttendanceHomePage> createState() => _AttendanceHomePageState();
}

class _AttendanceHomePageState extends State<AttendanceHomePage> {
  int _attendanceCount = 0;
  bool _checkedIn = false;

  void _toggleAttendance() {
    setState(() {
      _checkedIn = !_checkedIn;
      if (_checkedIn) {
        _attendanceCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric Attendance'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 48,
            backgroundImage: AssetImage('assets/avatar.png'), // Add your asset or use NetworkImage
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 16),
          Text(
            _checkedIn ? "Checked In" : "Not Checked In",
            style: TextStyle(
              color: _checkedIn ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 24),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
              child: Column(
                children: [
                  const Text(
                    "Total Attendance",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$_attendanceCount',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _toggleAttendance,
        icon: Icon(_checkedIn ? Icons.logout : Icons.fingerprint),
        label: Text(_checkedIn ? "Check Out" : "Check In"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CreateCourseScreen extends StatelessWidget {
  final TextEditingController code = TextEditingController();
  final TextEditingController name = TextEditingController();

  CreateCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Course')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: code, decoration: InputDecoration(labelText: 'Course Code')),
            TextField(controller: name, decoration: InputDecoration(labelText: 'Course Name')),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Create'),
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Course Created'))),
            )
          ],
        ),
      ),
    );
  }
}
