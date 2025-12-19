import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extensions/context_extensions.dart';
import 'package:portfolio/core/utils/extensions/num_extensions.dart';
import 'package:portfolio/core/widgets/generic_grid_view_builder.dart';
import 'package:portfolio/features/mobile/views/widgets/skill_card_mobile.dart';
import 'package:portfolio/features/skills/data/technincal_skills_model.dart';
import 'package:portfolio/main.dart';

class SkillsMobileSection extends StatelessWidget {
  const SkillsMobileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w(context)),
      child: GenericGridViewBuilder<TechnicalSkillsModel>(
        items: skillsData,
        childAspectRatio: context.isTabletSize ? 1.2 : 0.95,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(0),
        itemBuilder: (item) => SkillCardMobile(model: item),
      ),
    );
  }
}
