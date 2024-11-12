import 'package:flutter/material.dart';

import '../../../../../core/styles.dart';
import '../../../data/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.model});

  final OnboardingModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            model.title,
            style: Styles.tsArticleTitle,
          ),
          Text(
            model.body,
            style: Styles.tsH2Medium,
          ),

        ],
      ),
    );
  }
}
