import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';
import 'package:portfolio/features/experience/data/professional_experience_model.dart';
import 'package:portfolio/features/experience/views/widgets/experience_card.dart';

class ProfessionalExperienceSection extends StatelessWidget {
  final List<ProfessionalExperienceModel> professionalExperiences;
  const ProfessionalExperienceSection({
    super.key,
    required this.professionalExperiences,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SelectableText.rich(
              TextSpan(
                text: AppStrings.professional,
                style: TextStyle(
                  fontSize: 48.sp(context),
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
                children: [
                  TextSpan(
                    text: AppStrings.experience,
                    style: TextStyle(
                      fontSize: 48.sp(context),
                      color: AppColors.borderSkyLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SelectableText(
              AppStrings.experienceSubtitle,
              style: TextStyle(
                fontSize: 18.sp(context),
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),

            ...professionalExperiences.map(
              (professionalExperienceModel) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ExperienceCard(Experience: professionalExperienceModel),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
