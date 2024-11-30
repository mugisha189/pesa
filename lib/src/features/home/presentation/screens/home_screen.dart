import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pesa/shared/colors.dart';
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
    'Inicio',
    'Funciones',
    'Beneficios',
    'Estadisticas',
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.symmetric(vertical: 10.0).copyWith(bottom: 15.0),
        color: AppColors.primaryBackground(brightness),
        child: BottomNavigationBar(
          elevation: 0,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          backgroundColor: AppColors.primaryBackground(brightness),
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: AppColors.primaryText(brightness),
          selectedLabelStyle:const     TextStyle(
            height:
                2.0, 
          ),
          unselectedLabelStyle: const TextStyle(
            height:
                2.0,
          ),
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
      ),
    );
  }
}
