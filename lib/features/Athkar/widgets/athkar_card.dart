import 'package:flutter/material.dart';
import 'package:rafiq_muslim/core/utils/app_fonts.dart';

class AthkarCard extends StatelessWidget {
  final bool isDone;
  final Color color;
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const AthkarCard({
    super.key,
    required this.isDone,
    required this.color,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isDone ? 6 : 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: isDone
                ? LinearGradient(
                    colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
                  )
                : null,
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 32),
              ),

              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: AppFonts.ibmMedium.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              isDone
                  ? Icon(Icons.check_circle, color: Colors.green, size: 32)
                  : Icon(Icons.check_outlined, color: Colors.grey, size: 32),
            ],
          ),
        ),
      ),
    );
  }
}
