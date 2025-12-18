import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';

class SkySkill extends StatelessWidget {
  const SkySkill({super.key, required this.skill});

  final String skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.cardBackgroundColor,
        //  const Color(0XFF0D5673).withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0XFF0D5673)),
      ),
      child: Text(
        skill,
        style: const TextStyle(
          color: AppColors.white,
          // color: Color(0XFF02AEE9),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
