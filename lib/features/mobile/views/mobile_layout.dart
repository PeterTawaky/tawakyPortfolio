import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/features/mobile/views/widgets/experience_mobile_section.dart';
import 'package:portfolio/features/mobile/views/widgets/fixed_section.dart';
import 'package:portfolio/features/mobile/views/widgets/info_mobile_section.dart';
import 'package:portfolio/features/mobile/views/widgets/project_mobile_section.dart';
import 'package:portfolio/features/mobile/views/widgets/skills_mobile_section.dart';

class MobileLayout extends StatelessWidget {
  final PageController pageController = PageController();
  final ValueNotifier<int> currentIndex = ValueNotifier(0);
  final List<Widget> screens = [
    InfoMobileSection(),
    ExperienceMobileSection(),
    SkillsMobileSection(),
    ProjectMobileSection(),
  ];
  MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColors.gradientBackground),
      child: Column(
        children: [
          FixedSection(
            currentIndex: currentIndex,
            pageController: pageController,
          ),
          ValueListenableBuilder(
            valueListenable: currentIndex,
            builder: (context, value, child) {
              return Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return Expanded(child: screens[index]);
                  },
                  itemCount: 4,
                  onPageChanged: (value) {
                    log(value.toString());
                    currentIndex.value = value;
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
