import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_fonts.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';

class SpecialButton extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final String title;
  final void Function()? onTap;

  const SpecialButton({
    super.key,
    required this.textColor,
    required this.backgroundColor,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.buttonSky, width: 1),
          color: backgroundColor,
          // color: Color(0XFF00BFFF),
          borderRadius: BorderRadius.circular(10.sp(context)),
        ),
        alignment: Alignment.center,
        height: 44,
        width: 163.13,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: AppFonts.poppins,
          ),
        ),
      ),
    );
  }
}