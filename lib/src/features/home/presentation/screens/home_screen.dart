import 'package:flutter/material.dart';
import 'package:pesa/src/features/home/presentation/screens/benefits_screen.dart';
import 'package:pesa/src/features/home/presentation/screens/functions_screen.dart';
import 'package:pesa/src/features/home/presentation/screens/notifications_screen.dart';
import 'package:pesa/src/features/home/presentation/screens/settings_screen.dart';
import 'package:pesa/src/features/home/presentation/screens/statistics_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    FunctionsScreen(),
    BenefitsScreen(),
    StatisticsScreen(),
    NotificationsScreen(),
    SettingsScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Functions'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Benefits'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Statistics'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
} 