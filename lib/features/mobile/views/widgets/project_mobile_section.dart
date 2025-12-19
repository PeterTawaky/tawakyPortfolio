import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';
import 'package:portfolio/core/widgets/generic_grid_view_builder.dart';
import 'package:portfolio/features/mobile/views/widgets/project_card_mobile.dart';
import 'package:portfolio/features/projects/data/featured_projects_model.dart';
import 'package:portfolio/main.dart';

class ProjectMobileSection extends StatelessWidget {
  const ProjectMobileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w(context)),
        child: GenericGridViewBuilder<FeaturedProjectsModel>(
          childAspectRatio: 1.1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          padding: const EdgeInsets.all(0),
          items: projects,
          itemBuilder: (project) => ProjectCardMobile(project: project),
        ),
      ),
    );
  }
}
