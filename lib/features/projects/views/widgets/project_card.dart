import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_helpers.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';
import 'package:portfolio/features/projects/data/featured_projects_model.dart';

class ProjectCard extends StatefulWidget {
  final FeaturedProjectsModel item;
  const ProjectCard({super.key, required this.item});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackgroundColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isHover ? AppColors.borderSkyLight : AppColors.grey,
                width: isHover ? 2 : 0.5,
              ),
            ),
            child: Card(
              color: AppColors.cardBackgroundColor,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200.h(context),
                        width: constraints.maxWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.asset(widget.item.image, fit: BoxFit.fill),
                      ),
                      SizedBox(height: 16.h(context)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SelectableText(
                          widget.item.title,
                          style: TextStyle(
                            fontSize: 20.sp(context),
                            fontWeight: FontWeight.bold,
                            color: isHover
                                ? AppColors.borderSkyLight
                                : AppColors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SelectableText(
                          widget.item.description,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14.sp(context),
                            color: AppColors.grey,
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: InkWell(
                      onTap: () => AppHelpers.launingchUrl(
                        url: widget.item.externalLink,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.link,
                              size: 16,
                              color: AppColors.borderSkyLight,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Preview',
                              style: TextStyle(color: AppColors.borderSkyLight),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      //  Stack(
      //   children: [
      //     AnimatedContainer(
      //       duration: Duration(milliseconds: AppConstants.animationDuration),
      //       padding: EdgeInsetsDirectional.only(
      //         top: 40,
      //         bottom: 20,
      //         start: 30,
      //         end: 30,
      //       ),
      // decoration: BoxDecoration(
      //   color: AppColors.cardBackgroundColor,
      //   borderRadius: BorderRadius.circular(16),
      //   border: Border.all(
      //     color: isHover ? AppColors.borderSkyLight : AppColors.grey,
      //     width: isHover ? 1 : 0.5,
      //   ),
      // ),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      // Text(
      //   widget.item.title,
      //   style: TextStyle(
      //     fontSize: 20.sp(context),
      //     fontWeight: FontWeight.bold,
      //     color: isHover ? AppColors.borderSkyLight : AppColors.white,
      //   ),
      // ),
      //           SizedBox(height: 20),
      // Text(
      //   widget.item.description,
      //   style: TextStyle(
      //     fontSize: 14.sp(context),
      //     color: AppColors.grey,
      //   ),
      // ),
      //           SizedBox(height: 10),

      //           Spacer(),
      // InkWell(
      //   onTap: () =>
      //       AppHelpers.launingchUrl(url: widget.item.externalLink),
      //   child: Container(
      //     padding: EdgeInsets.symmetric(vertical: 4),
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(
      //       border: Border.all(color: AppColors.grey, width: 0.5),
      //       borderRadius: BorderRadius.circular(8),
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Icon(
      //           FontAwesomeIcons.link,
      //           size: 16,
      //           color: AppColors.borderSkyLight,
      //         ),
      //         SizedBox(width: 12),
      //         Text(
      //           'Preview',
      //           style: TextStyle(color: AppColors.borderSkyLight),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      //         ],
      //       ),
      //     ),
      //     Positioned(
      //       top: 1,
      //       left: 1,
      //       right: 1,
      //       child: Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      //           color: AppColors.projectColors[0],
      //         ),
      //         height: 20,
      //         // width: constrains.maxWidth,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
