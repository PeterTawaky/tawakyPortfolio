// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:portfolio/core/utils/app_colors.dart';
// import 'package:portfolio/core/utils/app_enums.dart';
// import 'package:portfolio/core/utils/app_helpers.dart';
// import 'package:portfolio/core/utils/extensions/context_extensions.dart';
// import 'package:portfolio/core/utils/extensions/num_extensions.dart';

// class SocialMediaButton extends StatefulWidget {
//   final String url;
//   final SocialMediaPlatform platform;
//   final Color color;

//   const SocialMediaButton({
//     super.key,
//     required this.platform,
//     required this.url,
//     required this.color,
//   });

//   @override
//   State<SocialMediaButton> createState() => _SocialMediaButtonState();
// }

// class _SocialMediaButtonState extends State<SocialMediaButton> {
//   bool isPressed = false;
//   bool isHover = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => isHover = true),
//       onExit: (_) => setState(() => isHover = false),
//       child: InkWell(
//         onTap: () => AppHelpers.launingchUrl(url: widget.url),

//         onTapDown: (_) {
//           setState(() => isPressed = true);
//         },
//         onTapUp: (_) {
//           setState(() => isPressed = false);
//         },
//         onTapCancel: () {
//           setState(() => isPressed = false);
//         },

//         borderRadius: BorderRadius.circular(14.sp(context)),

//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 150),
//           height: 50,
//           width: 50,
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: context.isDesktopSize
//                   ? isHover
//                         ? widget.color
//                         : AppColors.cardBackgroundColor
//                   : isPressed
//                   ? AppColors.textSky
//                   : AppColors.grey,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(14.sp(context)),
//             color: isPressed
//                 ? AppColors.textSky.withOpacity(0.15)
//                 : AppColors.cardBackgroundColor,
//           ),
//           child: Icon(
//             _getIcon(widget.platform),
//             color: context.isDesktopSize
//                 ? isHover
//                       ? widget.color
//                       : AppColors.grey
//                 : isPressed
//                 ? AppColors.textSky
//                 : AppColors.grey,
//             size: 24.sp(context),
//           ),
//         ),
//       ),
//     );
//   }

//   IconData _getIcon(SocialMediaPlatform platform) {
//     return switch (platform) {
//       SocialMediaPlatform.github => FontAwesomeIcons.github,
//       SocialMediaPlatform.linkedin => FontAwesomeIcons.linkedin,
//       SocialMediaPlatform.whatsapp => FontAwesomeIcons.whatsapp,
//       SocialMediaPlatform.x => FontAwesomeIcons.xTwitter,
//       SocialMediaPlatform.gmail => Icons.mail,
//       _ => Icons.error,
//     };
//   }
// }
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_enums.dart';
import 'package:portfolio/core/utils/app_helpers.dart';
import 'package:portfolio/core/utils/extensions/context_extensions.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';

class SocialMediaButton extends StatefulWidget {
  final String url;
  final SocialMediaPlatform platform;
  final Color color;

  const SocialMediaButton({
    super.key,
    required this.platform,
    required this.url,
    required this.color,
  });

  @override
  State<SocialMediaButton> createState() => _SocialMediaButtonState();
}

class _SocialMediaButtonState extends State<SocialMediaButton> {
  bool isHover = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(14.sp(context));

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: () => AppHelpers.launingchUrl(url: widget.url),
        onTapDown: (_) => setState(() => isPressed = true),
        onTapUp: (_) => setState(() => isPressed = false),
        onTapCancel: () => setState(() => isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(
            0,
            isPressed
                ? 4
                : isHover
                ? -2
                : 0,
            0,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: AppColors.cardBackgroundColor,
            border: Border.all(
              color: isHover ? widget.color : AppColors.cardBackgroundColor,
              width: 1,
            ),
            boxShadow: [
              // Main depth shadow
              BoxShadow(
                color: Colors.black.withOpacity(0.28),
                offset: Offset(0, isPressed ? 2 : 8),
                blurRadius: isPressed ? 4 : 14,
              ),

              // Soft highlight (fake light source)
              BoxShadow(
                color: Colors.white.withOpacity(0.06),
                offset: const Offset(-2, -2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Icon(
            _getIcon(widget.platform),
            size: 24.sp(context),
            color: isHover ? widget.color : AppColors.grey,
          ),
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
