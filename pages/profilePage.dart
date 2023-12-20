import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username = "Mz";
  final String occupation = "Software Engineer";
  final String email = "Mz@gamil.com";
  final String location = "Monofia, Egypt";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 250,
              // decoration: BoxDecoration(
              //   color: Colors.deepPurple,
              //   borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(20),
              //     bottomRight: Radius.circular(20),
              //   ),
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/profile_image.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    username,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    occupation,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Color(0xFF4A3298),
                    ),
                    title: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      email,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: Color(0xFF4A3298),
                    ),
                    title: Text(
                      'Location',
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      location,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for the "Edit Profile" button
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Change the text color here
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
