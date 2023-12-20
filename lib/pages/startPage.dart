import 'package:flutter/material.dart';
import 'package:project/pages/Auth/login.dart';
import 'package:project/pages/Auth/signup.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.fitness_center, // Replace with the gym-related icon
              size: 200, // Adjust the size as needed
              color: Color(0xFF4A3298), // Adjust the color as needed
            ),
          ),
          const SizedBox(height: 16),
          // Text
          Text(
            'IronPulse Gym',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          // Login Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Login Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text('Login'),
              ),
              const SizedBox(width: 16), // Add some spacing between buttons
              // Signup Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text('Sign Up'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
