import 'package:flutter/material.dart';
import 'package:rafiq_muslim/core/utils/app_fonts.dart';

import '../../Athkar/Athkar_view.dart';
import '../../Goals/Goals_view.dart';
import '../../Profile/Profile_view.dart';
import '../../prayer/prayer_view.dart';
import '../../quran/quran_view.dart';

class BottomBavbar extends StatefulWidget {
  const BottomBavbar({super.key});

  @override
  State<BottomBavbar> createState() => _BottomBavbarState();
}

class _BottomBavbarState extends State<BottomBavbar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const PrayerView(),
    const QuranView(),
    const AthkarView(),
    GoalsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(14),
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: bottomNavColor.withOpacity(0.95),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: bottomNavColor.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.mosque, 'الصلوات', 0),
              _buildNavItem(Icons.book, 'القرآن', 1),
              _buildNavItem(Icons.favorite, 'الأذكار', 2),
              _buildNavItem(Icons.flag, 'الأهداف', 3),
              _buildNavItem(Icons.person, 'الملف', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Builder(
        builder: (context) {
          final activeColor = Theme.of(context).colorScheme.secondary;
          final inactiveColor = Colors.grey[400];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: _currentIndex == index ? activeColor : inactiveColor,
                size: 24,
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: AppFonts.ibmMedium.copyWith(
                  color: _currentIndex == index ? activeColor : inactiveColor,
                  fontSize: 12,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
