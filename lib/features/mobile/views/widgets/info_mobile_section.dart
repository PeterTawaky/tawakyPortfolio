import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_helpers.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';

class InfoMobileSection extends StatelessWidget {
  const InfoMobileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h(context),
      children: [
        InfoMobileRow(icon: FontAwesomeIcons.mapPin, title: 'Cairo, Egypt'),
        InfoMobileRow(
          icon: FontAwesomeIcons.envelope,
          title: 'peterayman800@gmail.com',
        ),
        InfoMobileRow(
          icon: FontAwesomeIcons.code,
          title: 'Desktop | Web | Mobile',
        ),
        InfoMobileRow(icon: Icons.autorenew, title: 'n8n Workflows'),
        Spacer(),
        InkWell(
          onTap: () => AppHelpers.launingchUrl(url: AppStrings.cvDirectLink),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.textSky.withOpacity(0.95),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textSky.withOpacity(0.5),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.cv,
                  style: TextStyle(
                    fontSize: 12,
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
        ),
        SizedBox(height: 10.h(context)),
      ],
    );
  }
}

class InfoMobileRow extends StatelessWidget {
  final IconData icon;
  final String title;
  const InfoMobileRow({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w(context),
      children: [
        SizedBox(width: 32.w(context)),
        Icon(
          icon,
          color: AppColors.textSky,
          size: 18.sp(context),
          fontWeight: FontWeight.bold,
        ),
        Text(
          title,
          style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
