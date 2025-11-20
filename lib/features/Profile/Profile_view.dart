import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafiq_muslim/controllers/theme_controller.dart';
import 'package:rafiq_muslim/core/utils/app_fonts.dart';
import 'package:rafiq_muslim/features/Profile/widgets/achievement_tile.dart';
import 'package:rafiq_muslim/features/Profile/widgets/stat_row_widget.dart';
import 'package:snackly/snackly.dart';

class ProfileView extends StatelessWidget {
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الملف الشخصي',
          style: AppFonts.ibmMedium.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Icon(
                      Icons.person_2_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'تطبيق رفيق المسلم',
                    style: AppFonts.ibmMedium.copyWith(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'في رحلة الإيمان',
                    style: AppFonts.ibmMedium.copyWith(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('احصائيات سريعة', style: AppFonts.ibmMedium),
                ),
                Divider(height: 1, color: Colors.grey, thickness: 0.2),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      StatRow(
                        icon: Icons.mosque,
                        label: 'اجمالي الصلوات',
                        value: '1000',
                        color: Colors.green,
                      ),
                      const SizedBox(height: 12),
                      StatRow(
                        icon: Icons.local_fire_department,
                        label: 'أطول سلسلة',
                        value: '100 يوم',
                        color: Colors.orange,
                      ),
                      const SizedBox(height: 12),
                      StatRow(
                        icon: Icons.book,
                        label: 'ختمات القرآن',
                        value: '100',
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 12),
                      StatRow(
                        icon: Icons.favorite,
                        label: 'أيام الأذكار',
                        value: '100',
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "الانجازات",
                    style: AppFonts.ibmMedium.copyWith(fontSize: 18),
                  ),
                  trailing: Chip(
                    label: Text(
                      'عرض المزيد',
                      style: AppFonts.ibmMedium.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.amber[100],
                  ),
                ),
                const Divider(height: 1, color: Colors.grey, thickness: 0.2),
                AchievementTile(
                  achievement: {
                    'title': 'أول إنجاز',
                    'description': 'صيام الاثنين والخميس',
                    'icon': Icons.check_circle,
                    'color': Colors.green,
                    'unlocked': true,
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'الاعدادات',
                    style: AppFonts.ibmMedium.copyWith(fontSize: 18),
                  ),
                ),
                const Divider(height: 1, color: Colors.grey, thickness: 0.2),
                Obx(
                  () => SwitchListTile(
                    title: Text('الوضع الليلي', style: AppFonts.ibmMedium),
                    secondary: Icon(Icons.dark_mode),
                    value: themeController.isDark.value,
                    onChanged: (_) => themeController.toggleTheme(),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.color_lens),
                  title: Text('المظهر', style: AppFonts.ibmMedium),
                  trailing: DropdownButton<String>(
                    value: themeController.currentTheme.value,
                    items: [
                      DropdownMenuItem(
                        value: 'default',
                        child: Text(
                          'افتراضي',
                          style: AppFonts.ibmMedium.copyWith(fontSize: 14),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'ramadan',
                        child: Text(
                          'رمضان',
                          style: AppFonts.ibmMedium.copyWith(fontSize: 14),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'hajj',
                        child: Text(
                          'الحج',
                          style: AppFonts.ibmMedium.copyWith(fontSize: 14),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'spiritual',
                        child: Text(
                          'روحاني',
                          style: AppFonts.ibmMedium.copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                    onChanged: (val) {
                      if (val != null) themeController.changeTheme(val);
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('الإشعارات', style: AppFonts.ibmMedium),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Snackly.info(
                      context: context,
                      title: 'قريباً',
                      message: 'ستتوفر الإشعارات في التحديث القادم',
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Card(
            color: Colors.blue[50],
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(Icons.info_outline, size: 40, color: Colors.blue),
                  SizedBox(height: 12),
                  Text(
                    'رفيق المسلم',
                    style: AppFonts.ibmMedium.copyWith(
                      fontSize: 18,
                      color: themeController.isDark.value
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'نسخة 1.0.0',
                    style: AppFonts.ibmMedium.copyWith(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'تطبيق مجاني بالكامل لوجه الله تعالى',
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
    );
  }
}
