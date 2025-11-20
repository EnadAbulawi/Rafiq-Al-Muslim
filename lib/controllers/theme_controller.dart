import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafiq_muslim/core/utils/app_fonts.dart';
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
    update();
  }

  void changeTheme(String theme) {
    currentTheme.value = theme;
    storage.write('theme', theme);
    update();
  }

  ThemeData get lightTheme {
    final colors = _getThemeColors();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: colors['primary']!,
      scaffoldBackgroundColor: const Color(0xFFF8F9FA),

      colorScheme: ColorScheme.light(
        primary: colors['primary']!,
        secondary: colors['secondary']!,
        tertiary: colors['tertiary']!,
        surface: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: const Color(0xFF1A1A1A),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: colors['primary']!,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.cairo(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      textTheme: GoogleFonts.cairoTextTheme().apply(
        bodyColor: const Color(0xFF1A1A1A),
        displayColor: const Color(0xFF1A1A1A),
      ),

      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors['primary']!,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
          textStyle: AppFonts.ibmMedium.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors['secondary']!,
        foregroundColor: Colors.white,
        elevation: 4,
      ),

      iconTheme: IconThemeData(color: colors['primary']!),

      dividerTheme: DividerThemeData(color: Colors.grey[300], thickness: 0.2),
    );
  }

  ThemeData get darkTheme {
    final colors = _getThemeColors();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: colors['primary']!,
      scaffoldBackgroundColor: const Color(0xFF121212),

      colorScheme: ColorScheme.dark(
        primary: colors['primary']!,
        secondary: colors['secondary']!,
        tertiary: colors['tertiary']!,
        surface: const Color(0xFF1E1E1E),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: const Color(0xFFE0E0E0),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.cairo(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme).apply(
        bodyColor: const Color(0xFFE0E0E0),
        displayColor: const Color(0xFFE0E0E0),
      ),

      cardTheme: CardThemeData(
        color: const Color(0xFF1E1E1E),
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors['primary']!,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
          textStyle: AppFonts.ibmMedium.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors['secondary']!,
        foregroundColor: Colors.white,
        elevation: 4,
      ),

      iconTheme: IconThemeData(color: colors['secondary']!),

      dividerTheme: DividerThemeData(color: Colors.grey[800], thickness: 1),
    );
  }

  Map<String, Color> _getThemeColors() {
    switch (currentTheme.value) {
      case 'ramadan':
        return {
          'primary': const Color(0xFF6B2C91), // Royal Purple
          'secondary': const Color(0xFFFFD700), // Gold
          'tertiary': const Color(0xFF4A148C), // Deep Purple
        };
      case 'hajj':
        return {
          'primary': const Color(0xFF2E7D32), // Forest Green
          'secondary': const Color(0xFFC9A961), // Desert Gold
          'tertiary': const Color(0xFF1B5E20), // Dark Green
        };
      case 'spiritual':
        return {
          'primary': const Color(0xFF5C6BC0), // Serene Blue
          'secondary': const Color(0xFF211832), // Peaceful Purple
          'tertiary': const Color(0xFF3949AB), // Deep Indigo
        };
      default: // default theme
        return {
          'primary': const Color(0xFF0D7377), // Rich Teal
          'secondary': const Color(0xFF14FFEC), // Bright Cyan
          'tertiary': const Color(0xFFFFD700), // Gold
        };
    }
  }
}
