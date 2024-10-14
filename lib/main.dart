import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();
  String _errorMessage = '';

  void _handleLogin() {
    String input = _controller.text.trim();

    // Check if the input is a number
    if (RegExp(r'^[0-9]+$').hasMatch(input)) {
      int number = int.parse(input);

      // Check if the number is within the student range
      if (number >= 2018000000 && number <= 2024999999) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentLandingPage()),
        );
      } else {
        setState(() {
          _errorMessage = 'Invalid student number range.';
        });
      }
    }
    // Check if the input is alphabetic (for staff login)
    else if (RegExp(r'^[a-zA-Z]+$').hasMatch(input)) {
      if (input == 'root') {
        // Admin login
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminLandingPage()),
        );
      } else {
        // Staff login
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StaffLandingPage()),
        );
      }
    } else {
      setState(() {
        _errorMessage = 'Invalid input. Enter a valid number or username.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter number or username',
                border: OutlineInputBorder(),
                errorText: _errorMessage.isEmpty ? null : _errorMessage,
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Landing Page'),
      ),
      body: Center(
        child: Text(
          'Welcome, Student!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class StaffLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff Landing Page'),
      ),
      body: Center(
        child: Text(
          'Welcome, Staff!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class AdminLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Landing Page'),
      ),
      body: Center(
        child: Text(
          'Welcome, Admin!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
