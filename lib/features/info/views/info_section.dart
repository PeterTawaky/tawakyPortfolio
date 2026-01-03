import 'package:flutter/material.dart';
import 'package:portfolio/continuous_bounce_effect.dart';
import 'package:portfolio/core/utils/app_assets.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_enums.dart';
import 'package:portfolio/core/utils/app_helpers.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';
import 'package:portfolio/features/info/views/widgets/gradient_card.dart';
import 'package:portfolio/features/info/views/widgets/social_media_button.dart';
import 'package:portfolio/features/info/views/widgets/special_button.dart';
import 'package:portfolio/main.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SelectableText.rich(
                  TextSpan(
                    text: AppStrings.greeting,
                    style: TextStyle(
                      fontSize: 60.sp(context),
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
                GradientCard(
                  color1Begin: AppColors.buttonSky,
                  color2Begin: AppColors.borderSkyMedium,
                  color1End: AppColors.borderSkyDark,
                  color2End: AppColors.backGroundSkyDark,
                  child: SelectableText(
                    AppStrings.myName,
                    style: TextStyle(
                      fontSize: 60.sp(context),
                      color: AppColors.primaryBackgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            SelectableText(
              AppStrings.jobTitle,
              style: TextStyle(
                fontSize: 30.sp(context),
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SelectableText(
              AppStrings.subtitle,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SpecialButton(
                  textColor: AppColors.textBlack,
                  backgroundColor: AppColors.buttonSky,
                  title: AppStrings.viewMyWork,
                  onTap: () {
                    Scrollable.ensureVisible(
                      myWorkKey.currentContext!,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                SizedBox(width: 10),
                SpecialButton(
                  textColor: AppColors.textSky,
                  title: AppStrings.cv,
                  backgroundColor: AppColors.primaryBackgroundColor,
                  onTap: () =>
                      AppHelpers.launingchUrl(url: AppStrings.cvDirectLink),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
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
                  color: Color(0XFFEA4335),
                  platform: SocialMediaPlatform.gmail,
                  url:
                      'mailto:peter.ayman.dev@gmail.com',
                ),
                SizedBox(width: 10),

                SocialMediaButton(
                  color: Color(0XFF25D366),
                  platform: SocialMediaPlatform.whatsapp,
                  url: 'https://wa.me/201210711093',
                ),
                SizedBox(width: 10),

                SocialMediaButton(
                  color: Color(0XFF000000),
                  platform: SocialMediaPlatform.x,
                  url: 'https://x.com/Peter__Ayman',
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        ContinuousBounceEffect(
          duration: 1200,
          speedFactor: 1.5,
          bounceDistance: -8,
          child: Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderSkyDark, width: 4),
              image: DecorationImage(
                image: AssetImage(Assets.imagesTawaky),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
