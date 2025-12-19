import 'package:flutter/material.dart';
import 'package:portfolio/features/experience/data/professional_experience_model.dart';
import 'package:portfolio/features/mobile/views/widgets/experience_mobile_card.dart';

class ExperienceMobileSection extends StatelessWidget {
  const ExperienceMobileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ExperienceMobileCard(
      experience: ProfessionalExperienceModel(
        position: 'Flutter Developer',
        company: 'HA Technology',
        dateRange: 'June 2025 – Present',
        description:
            'Designed and implemented a comprehensive PV Solar SCADA System with advanced features for real-time monitoring and control of solar power installations.',
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
    );
  }
}
