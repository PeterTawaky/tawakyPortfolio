import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/extensions/context_extensions.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';
import 'package:portfolio/core/widgets/generic_grid_view_builder.dart';
import 'package:portfolio/features/skills/data/technincal_skills_model.dart';
import 'package:portfolio/features/skills/views/widgets/skills_card.dart';
import 'package:portfolio/main.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              text: AppStrings.technical,
              style: TextStyle(
                fontSize: 48.sp(context),
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
              children: [
                TextSpan(
                  text: AppStrings.skills,
                  style: TextStyle(
                    fontSize: 48.sp(context),
                    color: AppColors.borderSkyLight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Text(
            AppStrings.technicalSkillsSubtitle,
            style: TextStyle(
              fontSize: 18.sp(context),
              color: AppColors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          GenericGridViewBuilder<TechnicalSkillsModel>(
            crossAxisCount: context.isTabletSize ? 2 : 3,
            childAspectRatio: context.isTabletSize ? 1.3 : 1.9,
            items: skillsData,
            itemBuilder: (item) => SkillCard(model: item),
          ),
          // SkillsGridView(),
          // TechnicalSkillsCard(model: technicalSkills[0]),
        ],
      ),
    );
  }
}
