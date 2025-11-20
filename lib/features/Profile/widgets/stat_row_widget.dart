import 'package:flutter/material.dart';
import 'package:rafiq_muslim/core/utils/app_fonts.dart';

class StatRow extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;
  final String value;

  const StatRow({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(label, style: AppFonts.ibmMedium.copyWith(fontSize: 14)),
        ),
        Text(value, style: AppFonts.ibmMedium.copyWith(fontSize: 16)),
      ],
    );
  }
}
