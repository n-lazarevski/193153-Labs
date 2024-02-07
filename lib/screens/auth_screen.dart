import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the main screen after authentication
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: Text('Sign In'),
        ),
      ),
    );
  }
}