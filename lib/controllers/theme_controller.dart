import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafiq_muslim/data/services/storage_services.dart';

class ThemeController extends GetxController {
  final storage = StorageServices.instance;
  var isDark = false.obs;
  var currentTheme = 'default'.obs;

  @override
  void onInit() {
    super.onInit();
    isDark.value = storage.read('isDark') ?? false;
    currentTheme.value = storage.read('theme') ?? 'default';
  }

  void toggleTheme() {
    isDark.value = !isDark.value;
    storage.write('isDark', isDark.value);
  }

  void changeTheme(String theme) {
    currentTheme.value = theme;
    storage.write('theme', theme);
  }

  ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: _getThemeColor(),
      scaffoldBackgroundColor: Colors.grey[50],
      appBarTheme: AppBarTheme(backgroundColor: _getThemeColor(), elevation: 0),
      colorScheme: ColorScheme.light(
        primary: _getThemeColor(),
        secondary: _getSecondaryColor(),
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _getThemeColor(),
      scaffoldBackgroundColor: Color(0xFF1A1A1A),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF2D2D2D),
        elevation: 0,
      ),
      colorScheme: ColorScheme.dark(
        primary: _getThemeColor(),
        secondary: _getSecondaryColor(),
      ),
    );
  }

  Color _getThemeColor() {
    switch (currentTheme.value) {
      case 'ramadan':
        return Color(0xFF8B4513);
      case 'hajj':
        return Color(0xFF2C5530);
      case 'spiritual':
        return Color(0xFF4A5568);
      default:
        return Color(0xFF2E7D32);
    }
  }

  Color _getSecondaryColor() {
    switch (currentTheme.value) {
      case 'ramadan':
        return Color(0xFFFFD700);
      case 'hajj':
        return Color(0xFFC9A961);
      case 'spiritual':
        return Color(0xFF9F7AEA);
      default:
        return Color(0xFF66BB6A);
    }
  }
}
