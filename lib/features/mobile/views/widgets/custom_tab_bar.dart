import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_constants.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';

class CustomTabBar extends StatelessWidget {
  final PageController pageController;
  final List<String> tabNames = const [
    'Info',
    'Experience',
    'Skills',
    'Projects',
  ];
  final ValueNotifier<int> currentIndex;
  const CustomTabBar({
    super.key,
    required this.currentIndex,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: List.generate(tabNames.length, (index) {
        return InkWell(
          onTap: () {
            // currentIndex.value = index;
            pageController.animateToPage(
              index,
              duration: Duration(milliseconds: AppConstants.animationDuration),
              curve: Curves.fastOutSlowIn,
            );
          },
          child: Column(
            children: [
              Text(
                tabNames[index],
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp(context),
                ),
              ),
              SizedBox(height: 2.h(context)),
              AnimatedContainer(
                curve: Curves.easeInCirc,
                duration: Duration(
                  milliseconds: AppConstants.animationDuration,
                ),
                height: 4,
                width: currentIndex.value == index ? 70.w(context) : 0,
                decoration: BoxDecoration(
                  color: AppColors.borderSkyLight,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
