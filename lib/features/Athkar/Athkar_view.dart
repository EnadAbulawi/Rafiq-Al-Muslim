import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafiq_muslim/core/utils/app_fonts.dart';
import 'package:rafiq_muslim/features/Athkar/controllers/athkar_controller.dart';
import 'package:rafiq_muslim/features/Athkar/widgets/athkar_card.dart';

class AthkarView extends StatelessWidget {
  const AthkarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AthkarController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('الأذكار', style: AppFonts.ibmMedium),
        centerTitle: true,
        actions: [
          Obx(
            () => Padding(
              padding: EdgeInsetsGeometry.only(right: 16),
              child: Row(
                children: [
                  Icon(Icons.star, size: 20, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(
                    '${controller.athkarStreak.value}',
                    style: AppFonts.ibmMedium.copyWith(fontSize: 18),
                  ),
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
            AthkarCard(
              title: 'أذكار الصباح',
              icon: Icons.wb_sunny,
              color: Colors.orange,
              isDone: controller.morningDone.value,
              onTap: () => controller.toggleAthkar('morning'),
            ),
            AthkarCard(
              title: 'أذكار المساء',
              icon: Icons.nights_stay,
              color: Colors.indigo,
              isDone: controller.eveningDone.value,
              onTap: () => controller.toggleAthkar('evening'),
            ),
            AthkarCard(
              title: 'أذكار النوم',
              icon: Icons.bedtime,
              color: Colors.purple,
              isDone: controller.sleepDone.value,
              onTap: () => controller.toggleAthkar('sleep'),
            ),
            AthkarCard(
              title: 'أذكار الاستيقاظ',
              icon: Icons.wb_twilight,
              color: Colors.teal,
              isDone: controller.wakeupDone.value,
              onTap: () => controller.toggleAthkar('wakeup'),
            ),
            const SizedBox(height: 16),
            Card(
              color: Colors.amber[50],
              child: Padding(
                padding: EdgeInsetsGeometry.all(20),
                child: Column(
                  children: [
                    Icon(Icons.auto_awesome, size: 48, color: Colors.amber),
                    const SizedBox(height: 12),
                    Text(
                      'استمرارية الأذكار',
                      style: AppFonts.ibmMedium.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${controller.athkarStreak.value} يوم متتالي',
                      style: AppFonts.ibmMedium.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'أكمل أذكار الصباح والمساء يومياً للحفاظ على السلسلة',
                      style: AppFonts.ibmMedium.copyWith(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
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
