import 'package:flutter/material.dart';
import 'timetable_screen.dart'; // Import the homepage

class LoginPage extends StatelessWidget {
  // Function to simulate login
  void _login(BuildContext context) {
    // Simulate successful login
    bool isLoggedIn = true;

    if (isLoggedIn) {
      // Navigate to the homepage (TimetableScreen)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TimetableScreen()),
      );
    } else {
      // Show error message if login fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background.jpg'), // Replace 'background_image.jpg' with your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(
                  horizontal: 20.0), // Adjust margin for horizontal spacing
              height: 300, // Adjust the height as needed
              decoration: BoxDecoration(
                color:
                    Colors.white.withOpacity(0.7), // Adjust opacity as needed
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey[300]!, // Adjust border color as needed
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Username input field
                  TextField(
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  SizedBox(height: 20),
                  // Password input field
                  TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  // Login button
                  ElevatedButton(
                    onPressed: () => _login(context), // Call _login function
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
