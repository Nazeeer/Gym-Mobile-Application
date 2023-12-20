import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  final bool isFormValid;

  ConfirmationPage({required this.isFormValid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isFormValid
                ? Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 100,
                  )
                : Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 100,
                  ),
            SizedBox(height: 16),
            Text(
              isFormValid
                  ? 'Form Submitted Successfully'
                  : 'Form Submission Failed',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the home page
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
