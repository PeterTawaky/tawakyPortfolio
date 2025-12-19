import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/utils/app_colors.dart';
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
