import 'package:flutter/material.dart';
import './DatabaseHelper.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  ProfilePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        // backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<User?>(
          future: DatabaseHelper.instance.getUserr(username),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              User? user = snapshot.data;

              if (user != null) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/profile_image.png'),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Username: ${user.username}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Email: ${user.email}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Phone: ${user.phone}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Password: ${user.password}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                );
              } else {
                return Center(child: Text('User not found'));
              }
            }
          },
        ),
      ),
    );
  }

  void _deleteAccount(BuildContext context) {
    // Implement the logic for deleting the account
    // This could show a confirmation dialog before proceeding with deletion
    // You can use DatabaseHelper.instance.deleteUser(username) to delete the user
  }
}
