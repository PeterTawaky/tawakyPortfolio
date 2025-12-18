import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_constants.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';
import 'package:portfolio/features/experience/data/professional_experience_model.dart';
import 'package:portfolio/features/experience/views/widgets/sky_skill.dart';

class ExperienceCard extends StatefulWidget {
  final ProfessionalExperienceModel Experience;

  const ExperienceCard({super.key, required this.Experience});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: AppConstants.animationDuration),
        width: 920,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),

          border: Border.all(
            color: isHover ? AppColors.borderSkyLight : AppColors.grey,
            width: isHover ? 1 : 0.5,
          ),
          color: AppColors.cardBackgroundColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primaryBackgroundColor,
              radius: 8.r(context),
              child: CircleAvatar(
                backgroundColor: AppColors.borderSkyLight,
                radius: isHover ? 6.r(context) : 5.r(context),
              ),
            ),
            SizedBox(width: 8.w(context)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// HEADER ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.briefcase,
                            color: Color(0XFF02AEE9),
                          ),
                          SizedBox(width: 2.w(context)),
                          SelectableText(
                            widget.Experience.position,
                            style: const TextStyle(
                              color: Color(0XFFF2F2F2),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      /// DATE RANGE
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// POSITION

                  /// COMPANY
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      SelectableText(
                        widget.Experience.company,
                        style: const TextStyle(
                          color: AppColors.textSky,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 18,
                            color: Color(0XFF8F96A3),
                          ),
                          const SizedBox(width: 8),
                          SelectableText(
                            widget.Experience.dateRange,
                            style: const TextStyle(
                              color: Color(0XFF8F96A3),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  SelectableText.rich(
                    TextSpan(
                      text: AppStrings.haDescription1,
                      style: TextStyle(
                        fontSize: 16.sp(context),
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                      children: [
                        TextSpan(
                          text: AppStrings.haDescription2,
                          style: TextStyle(
                            fontSize: 16.sp(context),
                            color: AppColors.textSky,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: AppStrings.haDescription3,
                          style: TextStyle(
                            fontSize: 16.sp(context),
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// HIGHLIGHTS
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.Experience.highlights.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SelectableText(
                              "▸  ",
                              style: TextStyle(
                                color: Color(0XFF00BFFF),
                                fontSize: 16,
                              ),
                            ),
                            Expanded(
                              child: SelectableText(
                                item,
                                style: const TextStyle(
                                  color: Color(0XFF8F96A3),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 20),

                  /// SKILL TAGS
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: widget.Experience.skills.map((skill) {
                      return SkySkill(skill: skill);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
