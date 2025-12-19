// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:portfolio/core/utils/app_colors.dart';
// import 'package:portfolio/core/utils/app_enums.dart';
// import 'package:portfolio/core/utils/app_helpers.dart';
// import 'package:portfolio/core/utils/extensions/num_extensions.dart';

// class SocialMediaButton extends StatelessWidget {
//   final String url;
//   final SocialMediaPlatform platform;
//   const SocialMediaButton({
//     super.key,
//     required this.platform,
//     required this.url,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       hoverColor: AppColors.textSky,
//       focusColor: AppColors.textSky,
//       splashColor: AppColors.textSky,
//       onTap: () => AppHelpers.launingchUrl(url: url),
//       child: Container(
//         height: 50,
//         width: 50,
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColors.grey, width: 1),
//           borderRadius: BorderRadius.circular(14.sp(context)),
//           color: AppColors.cardBackgroundColor,
//         ),
//         child: switch (platform) {
//           SocialMediaPlatform.github => Icon(
//             FontAwesomeIcons.github,
//             color: AppColors.grey,
//             size: 24.sp(context),
//           ),

//           SocialMediaPlatform.linkedin => Icon(
//             FontAwesomeIcons.linkedin,
//             color: AppColors.grey,
//             size: 24.sp(context),
//           ),

//           SocialMediaPlatform.whatsapp => Icon(
//             FontAwesomeIcons.whatsapp,
//             color: AppColors.grey,
//             size: 24.sp(context),
//           ),
//           SocialMediaPlatform.x => Icon(
//             FontAwesomeIcons.xTwitter,
//             color: AppColors.grey,
//             size: 24.sp(context),
//           ),
//           SocialMediaPlatform.gmail => Icon(
//             Icons.mail,
//             color: AppColors.grey,
//             size: 24.sp(context),
//           ),
//           // default case (fallback)
//           _ => Icon(Icons.error, color: Colors.red),
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_enums.dart';
import 'package:portfolio/core/utils/app_helpers.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';

class SocialMediaButton extends StatefulWidget {
  final String url;
  final SocialMediaPlatform platform;

  const SocialMediaButton({
    super.key,
    required this.platform,
    required this.url,
  });

  @override
  State<SocialMediaButton> createState() => _SocialMediaButtonState();
}

class _SocialMediaButtonState extends State<SocialMediaButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppHelpers.launingchUrl(url: widget.url),

      onTapDown: (_) {
        setState(() => isPressed = true);
      },
      onTapUp: (_) {
        setState(() => isPressed = false);
      },
      onTapCancel: () {
        setState(() => isPressed = false);
      },

      borderRadius: BorderRadius.circular(14.sp(context)),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: isPressed ? AppColors.textSky : AppColors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(14.sp(context)),
          color: isPressed
              ? AppColors.textSky.withOpacity(0.15)
              : AppColors.cardBackgroundColor,
        ),
        child: Icon(
          _getIcon(widget.platform),
          color: isPressed ? AppColors.textSky : AppColors.grey,
          size: 24.sp(context),
        ),
      ),
    );
  }

  IconData _getIcon(SocialMediaPlatform platform) {
    return switch (platform) {
      SocialMediaPlatform.github => FontAwesomeIcons.github,
      SocialMediaPlatform.linkedin => FontAwesomeIcons.linkedin,
      SocialMediaPlatform.whatsapp => FontAwesomeIcons.whatsapp,
      SocialMediaPlatform.x => FontAwesomeIcons.xTwitter,
      SocialMediaPlatform.gmail => Icons.mail,
      _ => Icons.error,
    };
  }
}
