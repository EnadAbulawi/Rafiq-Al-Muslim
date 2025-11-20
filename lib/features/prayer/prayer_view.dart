import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafiq_muslim/core/utils/app_fonts.dart';
import 'package:rafiq_muslim/features/prayer/controller/prayer_controller.dart';
import 'package:rafiq_muslim/features/prayer/widget/prayer_card.dart';

class PrayerView extends StatelessWidget {
  const PrayerView({super.key});

  @override
  Widget build(BuildContext context) {
    final PrayerController controller = Get.find<PrayerController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('الصلوات', style: AppFonts.ibmMedium),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.orange,
                    size: 20,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '${controller.streak.value}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => ListView(
          padding: EdgeInsets.all(16),
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'اليوم',
                      style: AppFonts.ibmMedium.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${controller.getTodayCount()} /5',
                      style: AppFonts.ibmMedium.copyWith(
                        fontSize: 32,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: controller.getTodayCount() / 5,
                      backgroundColor: Colors.grey[300],
                      minHeight: 8,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ...controller.prayerNames.map(
              (prayer) => PrayerCard(prayer: prayer),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("اجمالي الصلوات", style: AppFonts.ibmMedium),
                        const SizedBox(height: 4),
                        Text(
                          '${controller.totalPrayers.value}',
                          style: AppFonts.ibmMedium.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Container(width: 1, height: 40, color: Colors.grey),
                    Column(
                      children: [
                        Text("الايام المتتالية", style: AppFonts.ibmMedium),
                        const SizedBox(height: 4),
                        Text(
                          '${controller.streak.value}',
                          style: AppFonts.ibmMedium.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
