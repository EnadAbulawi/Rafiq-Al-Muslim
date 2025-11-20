import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafiq_muslim/core/utils/app_fonts.dart';

import '../controller/prayer_controller.dart';

class PrayerCard extends StatelessWidget {
  final String prayer;
  final PrayerController controller = Get.find();
  PrayerCard({super.key, required this.prayer});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isChecked = controller.prayers[prayer] ?? false;
      return Card(
        margin: EdgeInsets.only(bottom: 12),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          title: Text(prayer, style: AppFonts.ibmMedium.copyWith(fontSize: 18)),
          leading: Icon(Icons.mosque, size: 30),
          trailing: Checkbox(
            value: isChecked,
            onChanged: (_) => controller.togglePrayer(prayer),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      );
    });
  }
}
