import 'package:flutter/material.dart';
import 'package:portfolio/continuous_bounce_effect.dart';
import 'package:portfolio/core/utils/app_assets.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_enums.dart';
import 'package:portfolio/core/utils/app_fonts.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/extensions/context_extensions.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';
import 'package:portfolio/features/info/views/widgets/social_media_button.dart';
import 'package:portfolio/features/mobile/views/widgets/custom_tab_bar.dart';

class FixedSection extends StatelessWidget {
  final PageController pageController;
  final ValueNotifier<int> currentIndex;

  const FixedSection({
    super.key,
    required this.currentIndex,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
          child: Column(
            children: [
              SizedBox(height: 160.h(context)),
              Container(
                height: 368.h(context),
                width: 353.w(context),
                decoration: BoxDecoration(
                  color: AppColors.cardBackgroundColor,
                  borderRadius: BorderRadius.circular(42.r(context)),
                  // border: Border.all(color: const Color(0XFF0D5673))),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 145.h(context)),
                    Text(
                      AppStrings.myName,
                      style: TextStyle(
                        // spa
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.poppins,
                        fontSize: 24.sp(context),
                      ),
                    ),
                    Text(
                      '@Flutter Developer',
                      style: TextStyle(
                        color: AppColors.grey,
                        // fontFamily: AppFonts.poppins,
                        fontSize: 12.sp(context),
                      ),
                    ),
                    SizedBox(height: 32.h(context)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w(context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SocialMediaButton(
                            color: Color(0XFF8800EA),
                            platform: SocialMediaPlatform.github,
                            url: 'https://github.com/PeterTawaky',
                          ),
                          SizedBox(width: 10),
                          SocialMediaButton(
                            color: Color(0XFF0A66C2),
                            platform: SocialMediaPlatform.linkedin,
                            url: 'https://www.linkedin.com/in/peterayman/',
                          ),
                          SizedBox(width: 10),

                          SocialMediaButton(
                            color: Color(0XFFD93025),
                            platform: SocialMediaPlatform.gmail,
                            url:
                                'mailto:peterayman800@gmail.com?subject=Contact%20from%20your%20website&body=Hello%20Peter,%0A%0AI%20would%20like%20to%20contact%20you.',
                          ),
                          SizedBox(width: 10),

                          SocialMediaButton(
                            color: Color(0XFF25D366),
                            platform: SocialMediaPlatform.whatsapp,
                            url: 'https://wa.me/201210711093',
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    ValueListenableBuilder(
                      valueListenable: currentIndex,
                      builder: (context, value, child) {
                        return CustomTabBar(
                          currentIndex: currentIndex,
                          pageController: pageController,
                        );
                      },
                    ),

                    // Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    //   children: [
                    //     InkWell(
                    //       onTap: () {},
                    //       child: Text(
                    //         'Info',
                    //         style: TextStyle(
                    //           color: AppColors.white,
                    //           fontWeight: FontWeight.w500,
                    //           fontSize: 14.sp(context),
                    //         ),
                    //       ),
                    //     ),
                    //     InkWell(
                    //       onTap: () {},
                    //       child: Text(
                    //         'Experience',
                    //         style: TextStyle(
                    //           color: AppColors.white,
                    //           fontWeight: FontWeight.w500,
                    //           fontSize: 14.sp(context),
                    //         ),
                    //       ),
                    //     ),
                    //     InkWell(
                    //       onTap: () {},
                    //       child: Text(
                    //         'Skills',
                    //         style: TextStyle(
                    //           color: AppColors.white,
                    //           fontWeight: FontWeight.w500,
                    //           fontSize: 14.sp(context),
                    //         ),
                    //       ),
                    //     ),
                    //     InkWell(
                    //       onTap: () {},
                    //       child: Text(
                    //         'Projects',
                    //         style: TextStyle(
                    //           color: AppColors.white,
                    //           fontWeight: FontWeight.w500,
                    //           fontSize: 14.sp(context),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 28.h(context)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: context.isTabletSize ? 111.5.w(context) : 91.5.w(context),
          top: 82.h(context),
          child: Container(
            alignment: Alignment.center,
            width: context.isTabletSize ? 160.w(context) : 220.w(context),
            height: 220.h(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.r(context)),
              gradient: AppColors.gradientBackground,
            ),

            child: ContinuousBounceEffect(
              duration: 1200,
              speedFactor: 1.5,
              bounceDistance: -8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.r(context)),
                child: Container(
                  width: 200.h(context),
                  height: 200.h(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r(context)),

                    border: Border.all(
                      color: AppColors.borderSkyDark,
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: AssetImage(Assets.imagesTawaky),
                      fit: BoxFit
                          .cover, // مهم عشان الصورة تغطي كامل الـ Container
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
