import 'package:flutter/material.dart';
import 'package:newsify/features/home/presentation/views/widgets/custom_back_button.dart';
import 'package:newsify/features/home/presentation/views/widgets/custom_title.dart';
import 'package:newsify/features/home/presentation/views/widgets/settings_about_expandable_section.dart';
import 'package:newsify/features/home/presentation/views/widgets/settings_about_feature_item.dart';
import 'package:newsify/features/home/presentation/views/widgets/settings_about_social_media_link.dart';

import '../../../../../core/utils/widgets/app_logo.dart';
import '../../../../../generated/l10n.dart';

class AboutViewBody extends StatelessWidget {
  const AboutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomTitle(title: '${S.of(context).about} ${S.of(context).title}'),
        leading: const CustomBackButton(),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // App Logo
          Center(child: AppLogo(size: 100),),
          const SizedBox(height: 24),

          // Mission Statement
          CustomTitle(title: S.of(context).our_mission_title),
          const SizedBox(height: 8),
          Text(S.of(context).our_mission_body),
          const SizedBox(height: 24),

          // Features Section
          ExpandableSection(
            title: S.of(context).features,
            initiallyExpanded: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FeatureItem(
                  icon: Icons.person_outline,
                  title: S.of(context).feature1_title,
                  description: S.of(context).feature1_body,
                ),
                FeatureItem(
                  icon: Icons.category_outlined,
                  title: S.of(context).feature2_title,
                  description: S.of(context).feature2_body,
                ),
                FeatureItem(
                  icon: Icons.offline_bolt_outlined,
                  title: S.of(context).feature3_title,
                  description: S.of(context).feature3_body,
                ),
                FeatureItem(
                  icon: Icons.notifications_outlined,
                  title: S.of(context).feature4_title,
                  description: S.of(context).feature4_body,
                ),
              ],
            ),
          ),

          // Version Info
          ExpandableSection(
            title: S.of(context).version,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).current_version),
                Text(S.of(context).last_update),
              ],
            ),
          ),

          // Contact Information
          ExpandableSection(
            title: S.of(context).contact_us,
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.email_outlined),
                  title: Text('Email'),
                  subtitle: Text('karimkhater45@gmail.com'),
                ),
                const ListTile(
                  leading: Icon(Icons.web_outlined),
                  title: Text('Website'),
                  subtitle: Text('www.newsify.com'),
                ),
                const Divider(),
                SocialMediaLink(
                  platform: 'Twitter',
                  handle: '@NewsifyApp',
                  icon: Icons.safety_check,  // Replace with appropriate icon
                  onTap: () {
                    // Add Twitter link handler
                  },
                ),
                SocialMediaLink(
                  platform: 'Facebook',
                  handle: '/NewsifyApp',
                  icon: Icons.facebook,
                  onTap: () {
                    // Add Facebook link handler
                  },
                ),
                SocialMediaLink(
                  platform: 'Instagram',
                  handle: '@NewsifyApp',
                  icon: Icons.camera_alt_outlined,
                  onTap: () {
                    // Add Instagram link handler
                  },
                ),
              ],
            ),
          ),

          // Credits
          ExpandableSection(
            title: S.of(context).credits,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).developed_by),
                Text('${S.of(context).news_sources}: https://newsdata.io/'),

              ],
            ),
          ),
        ],
      ),

    );
  }
}

