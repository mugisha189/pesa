import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pesa/shared/images.dart';
import 'package:pesa/src/features/home/presentation/screens/benefits_screen.dart';
import 'package:pesa/src/features/home/presentation/screens/dashboard_screen.dart';
import 'package:pesa/src/features/home/presentation/screens/functions_screen.dart';
import 'package:pesa/src/features/home/presentation/screens/statistics_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    DashboardScreen(),
    FunctionsScreen(),
    BenefitsScreen(),
    StatisticsScreen(),
  ];

  final List<String> _labels = [
    'Home',
    'Functions',
    'Benefits',
    'Settings',
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        backgroundColor:
            Colors.black,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white, 
        type: BottomNavigationBarType.fixed,
        items: List.generate(AppImages.bottomNavbarIcons.length, (index) {
          return BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex == index
                  ? AppImages.bottomNavbarActiveIcons[index]
                  : AppImages.bottomNavbarIcons[index],
              height: 24,
              width: 24, 
            ),
            label: _labels[index], 
          );
        }),
      ),
    );
  }
}
