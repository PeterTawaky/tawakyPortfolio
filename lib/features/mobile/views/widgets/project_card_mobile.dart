import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/features/mobile/views/widgets/project_mobile_details_widget.dart';
import 'package:portfolio/features/projects/data/featured_projects_model.dart';

class ProjectCardMobile extends StatelessWidget {
  final FeaturedProjectsModel project;

  const ProjectCardMobile({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectMobileDetailsWidget(project: project),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.gradientContainer,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.borderSkyDark.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.all(1.5),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.5)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.5),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Opacity(
                  opacity: 0.6,
                  child: Image.asset(project.image, fit: BoxFit.cover),
                ),

                // Enhanced Gradient Overlay (darker for better text visibility)
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.5), // Increased from 0.3
                        Colors.black.withOpacity(0.85), // Increased from 0.7
                      ],
                    ),
                  ),
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.title,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                              letterSpacing: 0.3,
                              height: 1.2,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 6, // Increased blur
                                  offset: Offset(0, 2),
                                ),
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 3,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 55),

                          Row(
                            children: [
                              Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.textSky.withOpacity(
                                    0.95,
                                  ), // Increased opacity
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.textSky.withOpacity(0.5),
                                      blurRadius: 8, // Increased glow
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Preview',
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primaryBackgroundColor,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      color: AppColors.primaryBackgroundColor,
                                      size: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
