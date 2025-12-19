import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/features/mobile/views/widgets/skill_details_page.dart';
import 'package:portfolio/features/skills/data/technincal_skills_model.dart';

class SkillCardMobile extends StatelessWidget {
  final TechnicalSkillsModel model;

  const SkillCardMobile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SkillDetailsPage(model: model),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.gradientContainer,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.borderSkyDark.withOpacity(0.2),
              blurRadius: 6,
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
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.buttonSky.withOpacity(0.2),
                      AppColors.textSky.withOpacity(0.15),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.borderSkyLight.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Icon(model.icon, color: AppColors.textSky, size: 24),
              ),

              const SizedBox(height: 10),

              // Title
              Text(
                model.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                  letterSpacing: 0.2,
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
