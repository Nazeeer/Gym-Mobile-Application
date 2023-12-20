import 'package:flutter/material.dart'; 
import '../DatabaseHelper.dart';
import './EditUserPage.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final dbHelper = DatabaseHelper.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: dbHelper.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No users found');
          } else {
            // Display the list of users
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var user = snapshot.data![index];
                return ListTile(
                  title: Text(user['username']),
                  subtitle: Text(user[
                      'password']), // For illustration purposes; consider security!
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Implement edit functionality
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditUserPage(user: user)),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Confirm Deletion'),
                                content: Text(
                                    'Are you sure you want to delete this user?'),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      Navigator.pop(
                                          context); // Close the dialog
                                      // Check if the 'id' field exists in the user map
                                      if (user.containsKey('id')) {
                                        await dbHelper.deleteUser(
                                            user['id']); // Delete user by 'id'
                                        setState(
                                            () {}); // Refresh the UI after deletion
                                      } else {
                                        // Handle the case where 'id' doesn't exist in the user map
                                      }
                                    },
                                    child: Text('Yes'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // Close the dialog
                                    },
                                    child: Text('No'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
    ),
);
}
}