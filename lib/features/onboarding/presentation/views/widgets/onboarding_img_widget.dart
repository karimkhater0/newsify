import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../generated/assets.dart';

class OnboardingImageWidget extends StatelessWidget {
  const OnboardingImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SvgPicture.asset(
        Assets.imagesOnboard,
        height: MediaQuery.sizeOf(context).height * .5,
      ),
    );
  }
}
