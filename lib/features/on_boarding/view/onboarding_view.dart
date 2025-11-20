import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafiq_muslim/core/utils/app_fonts.dart';
import 'package:rafiq_muslim/data/models/onboarding_model.dart';
import 'package:rafiq_muslim/data/services/storage_services.dart';

import '../../home/view/home_view.dart';
import '../widgets/onboarding_dots.dart';
import '../widgets/onboarding_page_items.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentIndex = page;
    });
  }

  Future<void> _skip() async {
    await StorageServices.instance.write('isFirstTime', false);
    if (mounted) {
      Get.offAll(() => HomeView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 60),
                  if (_currentIndex < onboardingItems.length - 1)
                    TextButton(
                      onPressed: _skip,
                      child: Text(
                        'تخطي',
                        style: AppFonts.ibmMedium.copyWith(fontSize: 18),
                      ),
                    )
                  else
                    const SizedBox(width: 60),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingItems.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  return OnboardingPageItems(
                    page: onboardingItems[index],
                    index: index,
                  );
                },
              ),
            ),
            OnboardingDots(currentIndex: _currentIndex),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 25,
              ),
              child: _currentIndex == onboardingItems.length - 1
                  ? ElevatedButton(
                      onPressed: _skip,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: onboardingItems[_currentIndex].color,
                      ),
                      child: Text(
                        'هيا بنا',
                        style: AppFonts.ibmMedium.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () => _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: onboardingItems[_currentIndex].color,
                      ),
                      child: Text(
                        'التالي',
                        style: AppFonts.ibmMedium.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
