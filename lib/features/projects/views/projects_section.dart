import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/extensions/context_extensions.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';
import 'package:portfolio/core/widgets/generic_grid_view_builder.dart';
import 'package:portfolio/features/projects/data/featured_projects_model.dart';
import 'package:portfolio/features/projects/views/widgets/project_card.dart';
import 'package:portfolio/main.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        key: myWorkKey,
        children: [
          Text.rich(
            TextSpan(
              text: AppStrings.featured,
              style: TextStyle(
                fontSize: 48.sp(context),
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
              children: [
                TextSpan(
                  text: AppStrings.projects,
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
            AppStrings.featuredProjectsSubtitle,
            style: TextStyle(
              fontSize: 18.sp(context),
              color: AppColors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),

          GenericGridViewBuilder<FeaturedProjectsModel>(
            crossAxisCount: context.isTabletSize ? 2 : 3,
            childAspectRatio: context.isTabletSize ? 0.8 : 0.9,
            items: projects,
            itemBuilder: (item) => ProjectCard(item: item),
          ),
        ],
      ),
    );
  }
}
