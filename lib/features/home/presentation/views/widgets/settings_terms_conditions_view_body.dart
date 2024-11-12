import 'package:flutter/material.dart';
import 'package:newsify/features/home/presentation/views/widgets/settings_about_expandable_section.dart';
import 'package:newsify/features/home/presentation/views/widgets/terms_bullet_point.dart';
import 'package:newsify/features/home/presentation/views/widgets/terms_section.dart';

import '../../../../../generated/l10n.dart';
import 'custom_back_button.dart';
import 'custom_title.dart';

class TermsAndConditionsViewBody extends StatelessWidget {
  const TermsAndConditionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomTitle(title: S.of(context).terms_conditions),
        leading: const CustomBackButton(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CustomTitle(title: S.of(context).terms_conditions),
          const SizedBox(height: 16),

          // Acceptance of Terms
          TermsSection(
            title: S.of(context).terms_section1_title,
            content: S.of(context).terms_section1_body,
          ),

          // Use License
          ExpandableSection(
            title: S.of(context).terms_section2_title,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).terms_section2_body),
                const SizedBox(height: 8),
                BulletPoint(S.of(context).terms_point1),
                BulletPoint(S.of(context).terms_point2),
                BulletPoint(S.of(context).terms_point3),
              ],
            ),
          ),


          const SizedBox(height: 24),
          Text(
            S.of(context).last_update,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

// Terms Section Widget

// Bullet Point Widget
