import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/utils/app_assets.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_enums.dart';
import 'package:portfolio/core/utils/app_fonts.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/extensions/context_extensions.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';
import 'package:portfolio/features/experience/data/professional_experience_model.dart';
import 'package:portfolio/features/experience/views/experience_section.dart';
import 'package:portfolio/features/info/views/info_section.dart';
import 'package:portfolio/features/info/views/widgets/social_media_button.dart';
import 'package:portfolio/features/mobile/views/mobile_layout.dart';
import 'package:portfolio/features/projects/data/featured_projects_model.dart';
import 'package:portfolio/features/projects/views/projects_section.dart';
import 'package:portfolio/features/skills/data/technincal_skills_model.dart';
import 'package:portfolio/features/skills/views/skills_section.dart';

void main() {
  bool stopPackage = false;
  runApp(
    DevicePreview(
      enabled: stopPackage,
      // enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
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
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Peter Tawaky Portfolio',
      debugShowCheckedModeBanner: false,
      home:
          // CutoutContainer(),
          Scaffold(
            body: LayoutBuilder(
              builder: (context, constraints) {
                if (context.isDesktopSize || context.isTabletSize) {
                  return DesktopAndTabletLayout();
                } else {
                  //for mobile
                  return MobileLayout();
                }
              },
            ),
          ),
    );
  }
}

//!!!!!!!!!!!!!!!!
class DesktopAndTabletLayout extends StatelessWidget {
  const DesktopAndTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
