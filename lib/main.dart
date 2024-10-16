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
  final TextEditingController _passwordController =
      TextEditingController(); // New password controller
  String _errorMessage = '';

  void _handleLogin() {
    String input = _controller.text.trim();
    String password = _passwordController.text.trim(); // Get password input

    // Check if both username and password are provided
    if (input.isNotEmpty && password.isNotEmpty) {
      // Proceed with login without specific conditions
      if (RegExp(r'^[0-9]+$').hasMatch(input)) {
        int number = int.parse(input);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentLandingPage()),
        );
      } else if (input == 'root') {
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
        _errorMessage =
            'Please enter both username and password.'; // Updated error message
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
            TextField(
              // New password field
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Enter password',
                border: OutlineInputBorder(),
              ),
              obscureText: true, // Hide password input
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
