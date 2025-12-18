import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/features/experience/data/professional_experience_model.dart';
import 'package:portfolio/features/mobile/views/widgets/experience_details_page.dart';

class ExperienceMobileCard extends StatelessWidget {
  final ProfessionalExperienceModel experience;

  const ExperienceMobileCard({Key? key, required this.experience})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // Navigate to details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExperienceDetailsPage(experience: experience),
          ),
        );
      },
      child: Container(
        width: screenWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          children: [
            // Gradient border container
            Container(
              decoration: BoxDecoration(
                gradient: AppColors.gradientContainer,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.borderSkyDark.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(1.2),
                decoration: BoxDecoration(
                  color: AppColors.cardBackgroundColor,
                  borderRadius: BorderRadius.circular(10.8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 12.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Company Name
                          Text(
                            experience.company,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                              letterSpacing: 0.3,
                              height: 1.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 4),

                          // Position
                          Text(
                            experience.position,
                            style: const TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSky,
                              letterSpacing: 0.2,
                              height: 1.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 6),

                          // Date Range
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_rounded,
                                size: 11,
                                color: AppColors.grey.withOpacity(0.8),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                experience.dateRange,
                                style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey.withOpacity(0.9),
                                  letterSpacing: 0.1,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Arrow indicator
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: AppColors.textSky.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ),

            // Left accent bar
            Positioned(
              left: 0,
              top: 12,
              bottom: 12,
              child: Container(
                width: 3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.buttonSky.withOpacity(0.6),
                      AppColors.textSky.withOpacity(0.9),
                      AppColors.buttonSky.withOpacity(0.6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
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
