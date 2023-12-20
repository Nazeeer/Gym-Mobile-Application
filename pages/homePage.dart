import 'package:flutter/material.dart';
import 'package:project/pages/UI/testimonialCard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHomePageContent(),
            // Add more pages if needed
          ],
        ),
      ),
    );
  }

  Widget _buildHomePageContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF4A3298),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text.rich(
            TextSpan(
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(text: "A Winter Surprise\n"),
                TextSpan(
                  text: "Discount 20%",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 260,
          child: PageView.builder(
            itemCount: 5, // Replace with the number of products
            itemBuilder: (BuildContext context, int index) {
              // Placeholder data for demonstration
              final productName = 'Product ${index + 1}';
              final productPrice =
                  '\$${(index + 10) * 55}'; // Replace with your product prices

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/download${index + 1}.jpeg', // Replace with your image path
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              productPrice,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        // Workout Categories (unchanged)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Popular Workouts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategory('Strength Training', Icons.fitness_center),
                  _buildCategory('Cardio', Icons.directions_run),
                  _buildCategory('Yoga', Icons.self_improvement),
                  _buildCategory('HIIT', Icons.access_alarm),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16), // Add padding as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Customer Testimonials',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 230,
                child: PageView.builder(
                  itemCount: 2, // Number of testimonials
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TestimonialCard(
                          testimonial:
                              'I love the intense workouts at IronPulse Gym. The atmosphere is motivating, and the trainers are incredible!',
                          memberName: 'Alice Johnson',
                          memberAvatar:
                              'assets/profile_image.png', // Replace with member avatar image path
                        ),
                      );
                    } else if (index == 1) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TestimonialCard(
                          testimonial:
                              'IronPulse Gym has transformed my fitness journey. The variety of workouts keeps things interesting!',
                          memberName: 'Bob Smith',
                          memberAvatar:
                              'assets/profile_image.png', // Replace with member avatar image path
                        ),
                      );
                    }
                    return Container(); // Return an empty container if index is out of bounds
                  },
                ),
              ),
            ],
          ),
        )

        // Add more content as needed
      ],
    );
  }

  Widget _buildCategory(String title, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Color(0xFF4A3298),
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
