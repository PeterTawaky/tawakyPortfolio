import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/features/experience/data/professional_experience_model.dart';

class ExperienceDetailsPage extends StatelessWidget {
  final ProfessionalExperienceModel experience;

  const ExperienceDetailsPage({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradientBackground,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom App Bar
              _buildAppBar(context),
              
              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Card
                      _buildHeaderCard(),
                      
                      const SizedBox(height: 20),
                      
                      // Description Section
                      _buildDescriptionSection(),
                      
                      const SizedBox(height: 20),
                      
                      // Highlights Section
                      _buildHighlightsSection(),
                      
                      const SizedBox(height: 20),
                      
                      // Skills Section
                      _buildSkillsSection(),
                      
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Back Button
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.cardBackgroundColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.borderSkyDark,
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.textSky,
                size: 20,
              ),
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Title
          const Expanded(
            child: Text(
              'Experience Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.gradientContainer,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.borderSkyDark.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          color: AppColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(14.5),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company Name with Icon
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.buttonSky.withOpacity(0.2),
                        AppColors.borderSkyMedium.withOpacity(0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.business_rounded,
                    color: AppColors.textSky,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        experience.company,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        experience.position,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSky,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Date Range
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.borderSkyDark.withOpacity(0.5),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.calendar_today_rounded,
                    size: 14,
                    color: AppColors.textSky,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    experience.dateRange,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        _buildSectionTitle('About the Role', Icons.description_rounded),
        
        const SizedBox(height: 12),
        
        // Description Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.borderSkyDark.withOpacity(0.5),
            ),
          ),
          child: Text(
            experience.description,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.white.withOpacity(0.9),
              height: 1.6,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHighlightsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        _buildSectionTitle('Key Highlights', Icons.star_rounded),
        
        const SizedBox(height: 12),
        
        // Highlights List
        ...experience.highlights.asMap().entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gradient Bullet
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.buttonSky,
                        AppColors.textSky,
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                
                const SizedBox(width: 12),
                
                // Highlight Text
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.borderSkyDark.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      entry.value,
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withOpacity(0.9),
                        height: 1.5,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        _buildSectionTitle('Technologies & Skills', Icons.code_rounded),
        
        const SizedBox(height: 12),
        
        // Skills Chips
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: experience.skills.map((skill) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.borderSkyDark.withOpacity(0.3),
                    AppColors.borderSkyMedium.withOpacity(0.2),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.borderSkyDark.withOpacity(0.5),
                ),
              ),
              child: Text(
                skill,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSky,
                  letterSpacing: 0.3,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.buttonSky.withOpacity(0.2),
                AppColors.borderSkyMedium.withOpacity(0.2),
              ],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: AppColors.textSky,
            size: 18,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}