import 'package:flutter/material.dart';
import 'package:project/pages/homePage.dart';
import 'package:project/pages/Auth/login.dart';
import 'package:project/pages/UI/cardDetails.dart';
import 'package:project/pages/profilePage.dart';
import 'package:project/pages/Auth/AdminPage.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  HomeScreen({required this.username});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _logout() {
    // Log out and navigate back to the login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IronPulse Gym'),
        centerTitle: true,
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_currentIndex == 0) {
      // Profile Tab
      return HomePage();
    } else if (_currentIndex == 1) {
      // Cards Tab
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardDetailsPage(
                        title: '1 Month',
                        description:
                            'Embark on a transformative fitness journey with our exclusive 1-month gym membership. Unleash your potential and achieve your fitness goals in a state-of-the-art facility equipped with top-notch training equipment and expert guidance. Whether you\'re aiming to build strength, improve endurance, or simply embrace a healthier lifestyle, our tailored programs and dedicated trainers will support you every step of the way. Elevate your fitness experience, push your limits, and embrace a fitter, healthier you in just one month!',
                        imagePath: 'assets/month.jpg',
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/month.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Center(
                          child: Text(
                            '1 Month',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardDetailsPage(
                        title: '2 Months',
                        description:
                            'Step into a two-month fitness odyssey with our comprehensive gym membership. Gain access to premium facilities and personalized workout plans designed to maximize your fitness journey. With two months at your disposal, you\'ll have ample time to sculpt your body, boost stamina, and adopt a healthier lifestyle. Our experienced trainers will guide you through dynamic workouts and provide tailored advice to optimize your progress. Unleash your potential, surpass your fitness milestones, and experience the transformative power of consistent dedication over two fulfilling months.',
                        imagePath: 'assets/2months.jpg',
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/2months.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Center(
                          child: Text(
                            '2 Months',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardDetailsPage(
                        title: '3 Months',
                        description:
                            'Commit to a rewarding three-month fitness expedition with our inclusive gym membership. Explore a holistic approach to wellness as you engage in a comprehensive fitness program designed to inspire and challenge. Over three months, you\'ll have the opportunity to cultivate lasting habits, refine your workout routines, and witness remarkable improvements in strength, endurance, and overall well-being. Our dedicated trainers will provide continual support, offering expertise and motivation to ensure every workout counts. Embrace this extended fitness journey, unlock new levels of vitality, and experience the transformative impact of sustained dedication over three empowering months.',
                        imagePath: 'assets/3months.jpg',
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/3months.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Center(
                          child: Text(
                            '3 Months',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardDetailsPage(
                        title: '6 Months',
                        description:
                            'Embark on an extensive six-month fitness expedition and witness a transformative journey towards a healthier, stronger you. Our six-month gym membership offers an immersive experience, allowing you ample time to achieve and surpass your fitness aspirations. With access to premium amenities and personalized workout plans, you\'ll have the tools to sculpt your physique, enhance endurance, and elevate your overall well-being. Throughout this extended period, our expert trainers will provide continuous guidance, ensuring your progress stays on track and encouraging you to push your limits. Embrace the opportunity, commit to long-term fitness, and discover the remarkable benefits of dedicated consistency over six fulfilling months.',
                        imagePath: 'assets/6months.jpg',
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/6months.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Center(
                          child: Text(
                            '6 Months',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardDetailsPage(
                        title: '1 Year',
                        description:
                            'Embark on a transformative and sustainable fitness journey with our comprehensive one-year gym membership. With a full year at your disposal, you\'ll have the opportunity to revolutionize your lifestyle, achieve remarkable fitness milestones, and experience enduring wellness. Access our state-of-the-art facilities equipped with cutting-edge equipment, designed to support your diverse fitness goals. Our seasoned trainers will provide personalized guidance, helping you design a workout regimen tailored to your needs and preferences. Embrace the journey towards holistic health, witness substantial progress, and enjoy the long-term benefits of a committed year-long dedication to your fitness and well-being.',
                        imagePath: 'assets/year.jpg',
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/year.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Center(
                          child: Text(
                            '1 Year',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text('Profile'),
              leading: Icon(
                Icons.person,
                color: Color(0xFF4A3298),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(username: widget.username),
                  ),
                );
              },
            ),
            Divider(), // Add a divider between items
            ListTile(
              title: Text('Admin'),
              leading: Icon(
                Icons.admin_panel_settings,
                color: Color(0xFF4A3298),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminPage()),
                );
              },
            ),
            Divider(), // Add a divider between items
            ListTile(
              title: Text('Privacy'),
              leading: Icon(
                Icons.privacy_tip,
                color: Color(0xFF4A3298),
              ),
              onTap: () {
                _logout();
                // Perform logout action
                // Add your logout logic here
              },
            ),
            Divider(), // Add a divider between items
            ListTile(
              title: Text('Language'),
              leading: Icon(
                Icons.language,
                color: Color(0xFF4A3298),
              ),
              onTap: () {
                _logout();
                // Perform logout action
                // Add your logout logic here
              },
            ),
            Divider(), // Add a divider between items
            ListTile(
              title: Text('Add Payment'),
              leading: Icon(
                Icons.payment,
                color: Color(0xFF4A3298),
              ),
              onTap: () {
                _logout();
                // Perform logout action
                // Add your logout logic here
              },
            ),
            Divider(), // Add a divider between items
            ListTile(
              title: Text('Logout'),
              leading: Icon(
                Icons.exit_to_app,
                color: Color(0xFF4A3298),
              ),
              onTap: () {
                _logout();
                // Perform logout action
                // Add your logout logic here
              },
            ),
          ],
        ),
      );
    }
  }
}
