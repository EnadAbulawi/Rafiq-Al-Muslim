import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafiq_muslim/controllers/theme_controller.dart';
import 'package:rafiq_muslim/data/services/storage_services.dart';
import 'package:rafiq_muslim/features/Athkar/controllers/athkar_controller.dart';
import 'package:rafiq_muslim/features/Goals/controllers/goals_controller.dart';
import 'package:rafiq_muslim/features/prayer/controller/prayer_controller.dart';
import 'features/home/view/home_view.dart';
import 'features/on_boarding/view/onboarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageServices.init();

  Get.put(PrayerController());
  Get.put(AthkarController());
  Get.put(ThemeController());
  Get.put(GoalsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isFirstTime = StorageServices.instance.read('isFirstTime');
    return GetBuilder<ThemeController>(
      builder: (ThemeController controller) => GetMaterialApp(
        title: 'رفيق العبادة',
        debugShowCheckedModeBanner: false,
        theme: controller.lightTheme,
        darkTheme: controller.darkTheme,
        themeMode: controller.isDark.value ? ThemeMode.dark : ThemeMode.light,
        home: isFirstTime ? OnboardingView() : HomeView(),
      ),
    );
  }
}
