import 'package:flutter/material.dart';

class OnboardingModel {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String? image;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.image,
  });
}

final List<OnboardingModel> onboardingItems = [
  OnboardingModel(
    title: 'مرحباً بك في رفيق المسلم',
    description:
        'أهلا بك في تطبيق رفيق المسلم رفيقك اليومي لمتابعة حياتك ك مسلم',
    icon: Icons.search,
    color: Colors.blue,
  ),
  OnboardingModel(
    title: 'تتبع عباداتك اليومية بسهولة',
    description:
        'تطبيق رفيق المسلم سيمكنك من متابعة صلواتك واذكارك ووردك اليومي من القران الكريم ',
    icon: Icons.search,
    color: Colors.blue,
  ),
  OnboardingModel(
    title: 'احصل على إنجازات وكن الأفضل',
    description:
        'تطبيق رفيق المسلم سيمكنك من متابعة صلواتك واذكارك ووردك اليومي من القران الكريم ',
    icon: Icons.search,
    color: Colors.blue,
  ),
  OnboardingModel(
    title: 'ابدأ الآن',
    description: 'لنبدأ رحلتنا في تطبيق رفيق المسلم',
    icon: Icons.start,
    color: Colors.green,
  ),
];
