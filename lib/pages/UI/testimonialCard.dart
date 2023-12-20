import 'package:flutter/material.dart';

class TestimonialCard extends StatelessWidget {
  final String testimonial;
  final String memberName;
  final String memberAvatar;

  TestimonialCard({
    required this.testimonial,
    required this.memberName,
    required this.memberAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(memberAvatar),
              ),
              SizedBox(height: 12),
              Text(
                testimonial,
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              SizedBox(height: 12),
              Text(
                '- $memberName',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
