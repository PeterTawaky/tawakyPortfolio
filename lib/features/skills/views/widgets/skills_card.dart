import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_constants.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';
import 'package:portfolio/features/experience/views/widgets/sky_skill.dart';
import 'package:portfolio/features/skills/data/technincal_skills_model.dart';

class SkillCard extends StatefulWidget {
  final TechnicalSkillsModel model;

  const SkillCard({super.key, required this.model});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: AppConstants.animationDuration),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isHover ? AppColors.borderSkyLight : Colors.white12,
            width: isHover ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ICON
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(widget.model.icon, color: Colors.blue, size: 20),
            ),

            const SizedBox(height: 16),

            // TITLE
            Text(
              widget.model.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: isHover ? AppColors.borderSkyLight : Colors.white,
              ),
            ),

            SizedBox(height: 16.h(context)),

            // SKILLS AS TAGS
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.model.items
                  .map((item) => SkySkill(skill: item))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
