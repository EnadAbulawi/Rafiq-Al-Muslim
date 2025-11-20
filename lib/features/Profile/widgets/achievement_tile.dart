import 'package:flutter/material.dart';
import 'package:rafiq_muslim/core/utils/app_fonts.dart';

class AchievementTile extends StatelessWidget {
  final Map<String, dynamic> achievement;
  const AchievementTile({super.key, required this.achievement});

  @override
  Widget build(BuildContext context) {
    bool unlocked = achievement['unlocked'];
    return ListTile(
      title: Text(
        achievement['title'],
        style: AppFonts.ibmMedium.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: unlocked ? Colors.blue : Colors.grey,
        ),
      ),
      subtitle: Text(
        achievement['description'],
        style: AppFonts.ibmMedium.copyWith(
          fontSize: 12,
          color: Colors.grey[600],
        ),
      ),
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: unlocked
              ? achievement['color'].withOpacity(0.2)
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          achievement['icon'],
          color: unlocked ? achievement['color'] : Colors.grey,
          size: 24,
        ),
      ),
      trailing: unlocked
          ? Icon(Icons.check_circle, color: Colors.green, size: 28)
          : Icon(Icons.lock, color: Colors.grey, size: 24),
    );
  }
}
