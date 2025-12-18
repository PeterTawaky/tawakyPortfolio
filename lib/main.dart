import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/utils/app_assets.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_enums.dart';
import 'package:portfolio/core/utils/app_fonts.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';
import 'package:portfolio/features/experience/data/professional_experience_model.dart';
import 'package:portfolio/features/experience/views/experience_section.dart';
import 'package:portfolio/features/info/views/info_section.dart';
import 'package:portfolio/features/projects/data/featured_projects_model.dart';
import 'package:portfolio/features/projects/views/projects_section.dart';
import 'package:portfolio/features/skills/data/technincal_skills_model.dart';
import 'package:portfolio/features/skills/views/skills_section.dart';

void main() {
  runApp(MyApp());
}

final GlobalKey myWorkKey = GlobalKey();

List<ProfessionalExperienceModel> professionalExperiences = [
  ProfessionalExperienceModel(
    position: 'Flutter Developer',
    company: 'HA Technology',
    dateRange: 'June 2025 – Present',
    description:
        'Designed and implemented a comprehensive PV Solar SCADA System with advanced features:',
    highlights: [
      'Integrated PLC communication via Snap7 for real-time industrial data acquisition',
      'Implemented RBAC authentication system for secure access control',
      'Developed dynamic Excel-imported tag management for flexible system configuration',
      'Created real-time telemetry visualization using LTTB downsampling and Flutter Canvas',
    ],
    skills: [
      'Flutter',
      'Dart',
      'Snap7',
      'RBAC',
      'LTTB',
      'Canvas',
      'SCADA',
      'IoT',
    ],
  ),
];
final List<TechnicalSkillsModel> skillsData = [
  TechnicalSkillsModel(
    icon: FontAwesomeIcons.code,
    title: "Languages & Tools",
    items: ["Flutter", "Dart", "Firebase", "Git", "GitHub", "C", "C++", "OOP"],
  ),
  TechnicalSkillsModel(
    icon: FontAwesomeIcons.projectDiagram,
    title: "Architecture",
    items: ["MVVM", "Clean Architecture", "Design Patterns"],
  ),
  TechnicalSkillsModel(
    icon: FontAwesomeIcons.database,
    title: "State Management",
    items: ["Cubit", "Bloc", "Provider"],
  ),
  TechnicalSkillsModel(
    icon: FontAwesomeIcons.database,
    title: "Databases",
    items: ["Hive", "sqflite", "Shared Preferences"],
  ),
  TechnicalSkillsModel(
    icon: FontAwesomeIcons.microchip,
    title: "Hardware Knowledge",
    items: ["Electronics", "Wireless", "Microcontrollers", "Sensors"],
  ),
  TechnicalSkillsModel(
    icon: FontAwesomeIcons.userGear,
    title: "Soft Skills",
    items: ["Problem-solving", "Teamwork", "Communication", "Time Management"],
  ),
];
final List<FeaturedProjectsModel> projects = [
  FeaturedProjectsModel(
    externalLink:
        'https://drive.google.com/file/d/1_FH9MzL86kxGIE7kJ-3UGX79kOAkvu_G/view?usp=sharing',
    pointOfView: PointOfView.secured,
    title: "SCADA - PV Solar System",
    description:
        'Industrial Automation Desktop Project for Data Visualization and Control.',
    items: [
      'Snap7',
      'LTTB downsampling',
      'RBAC',
      'Streams',
      'Tia',
      'PLC Integration',
      'Analytics',
    ],
    image: Assets.imagesScadaCover,
  ),
  FeaturedProjectsModel(
    pointOfView: PointOfView.gitHub,
    title: "GoPark - Smart Parking System",
    description:
        'IoT-enabled parking management system with ESP32 integration for remote garage control. Features Firebase authentication, real-time monitoring, and local authentication with Cubit state management.',
    items: [
      'IoT',
      'ESP32',
      'Cubit',
      'Firebase',
      'Biometric Authentication',
      'DI',
    ],
    externalLink:
        'https://drive.google.com/file/d/1X9b5GCRO1X1Y2cSOr_jVvee2h0HVMG_y/view?usp=sharing',
    image: Assets.imagesGoParkCover,
  ),
  FeaturedProjectsModel(
    externalLink:
        'https://everlasting-chip-3ae.notion.site/5de5201af48d49eebddeac15ddf1cbff?v=bec9cb526f774eb292fbfea04b652f69&source=copy_link',
    pointOfView: PointOfView.gitHub,
    title: "MTE Notion Template",
    description: 'Tracking my Daily habit and add them to notion database',
    items: [
      'Notion Integration',
      'API',
      'Secure Token Storage',
      'Bloc',
      'CRUD',
      'HTTP',
    ],
    image: Assets.imagesNotionCover,
  ),
  FeaturedProjectsModel(
    externalLink:
        'https://everlasting-chip-3ae.notion.site/5de5201af48d49eebddeac15ddf1cbff?v=bec9cb526f774eb292fbfea04b652f69&source=copy_link',
    pointOfView: PointOfView.gitHub,
    title: "Stock Management System - n8n",
    description: 'Tracking my Daily habit and add them to notion database',
    items: [
      'Notion Integration',
      'API',
      'Secure Token Storage',
      'Bloc',
      'CRUD',
      'HTTP',
    ],
    image: Assets.imagesN8nCover,
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peter Tawaky Portfolio',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: AppColors.gradientBackground),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100.h(context)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: InfoSection(),
                ),
                SizedBox(height: 80.h(context)),
                ProfessionalExperienceSection(
                  professionalExperiences: professionalExperiences,
                ),
                SizedBox(height: 80.h(context)),
                SkillsSection(),
                SizedBox(height: 80.h(context)),
                ProjectsSection(),
                SizedBox(height: 80.h(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class GradientCard extends StatefulWidget {
  final Widget child;
  final Color color1Begin;
  final Color color2Begin;
  final Color color1End;
  final Color color2End;
  const GradientCard({
    super.key,
    required this.child,
    required this.color1Begin,
    required this.color2Begin,
    required this.color1End,
    required this.color2End,
  });

  @override
  State<GradientCard> createState() => _GradientCardState();
}

class _GradientCardState extends State<GradientCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _color1;
  late Animation<Color?> _color2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _color1 = ColorTween(
      begin: widget.color1Begin,
      end: widget.color1End,
    ).animate(_controller);
    _color2 = ColorTween(
      begin: widget.color2Begin,
      end: widget.color2End,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [_color1.value!, _color2.value!]),
            borderRadius: BorderRadius.circular(16),
          ),
          child: widget.child,
        );
      },
    );
  }
}
