import 'package:flutter/material.dart';
import 'package:rafiq_muslim/core/utils/app_fonts.dart';
import 'package:rafiq_muslim/data/models/onboarding_model.dart';

class OnboardingPageItems extends StatelessWidget {
  final OnboardingModel page;
  final int index;
  const OnboardingPageItems({
    super.key,
    required this.page,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isEven = index % 2 == 0;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 50 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الأيقونة/الصورة
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [page.color, page.color.withOpacity(0.6)],
                  begin: isEven ? Alignment.topLeft : Alignment.topRight,
                  end: isEven ? Alignment.bottomRight : Alignment.bottomLeft,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: page.color.withOpacity(0.3),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Icon(page.icon, size: 100, color: Colors.white),
            ),

            const SizedBox(height: 60),
            // العنوان
            Text(
              page.title,
              textAlign: TextAlign.center,
              style: AppFonts.ibmMedium.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),

            const SizedBox(height: 20),
            // الوصف
            Text(
              page.description,
              textAlign: TextAlign.center,
              softWrap: true,
              textDirection: TextDirection.rtl,

              style: AppFonts.ibmMedium.copyWith(
                fontSize: 16,
                color: Colors.black54,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
