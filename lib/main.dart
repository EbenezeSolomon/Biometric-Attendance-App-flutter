// main.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/lecturer_dashboard_screen.dart';
import 'screens/enroll_student_screen.dart';
import 'screens/create_course_screen.dart';
import 'screens/attendance_screen.dart';
import 'screens/attendance_log_screen.dart';
import 'services/database_service.dart';

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biometric Attendance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: isLoggedIn ? '/dashboard' : '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/dashboard': (context) => LecturerDashboardScreen(),
        '/enroll': (context) => EnrollStudentScreen(),
        '/create_course': (context) => CreateCourseScreen(),
        '/attendance': (context) => AttendanceScreen(),
        '/logs': (context) => AttendanceLogScreen(),
      },
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService().initDB();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biometric Attendance App')),
      body: Center(child: Text('$_counter')),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
