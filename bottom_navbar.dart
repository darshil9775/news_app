import 'package:flutter/material.dart';
import 'package:news_app/seven_scr.dart'; // Import your actual screen pages

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0; // Track selected tab index

  // List of screens/pages
  final List<Widget> screen = [
    NewsHomePage(), // Your News Page
    PlaceholderScreen(title: "Ads"), // Replace with actual screen
    PlaceholderScreen(title: "Add Post"), // Replace with actual screen
    PlaceholderScreen(title: "Poll"), // Replace with actual screen
    PlaceholderScreen(title: "Profile"), // Replace with actual screen
  ];

  // Function to change screen on tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Corrected
        onTap: _onItemTapped, // Corrected
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.ad_units), label: "Ads"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 35), label: "Add Post"),
          BottomNavigationBarItem(icon: Icon(Icons.poll), label: "Poll"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// Placeholder screen (Replace with actual screens)
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
