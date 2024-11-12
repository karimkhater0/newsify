import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../generated/assets.dart';
import '../../cache_helper.dart';

class AppLogo extends StatelessWidget {
  AppLogo({super.key, this.size});

  final double? size;
  final bool isDark = CacheHelper.getData(key: 'isDark') ?? false;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isDark
          ? Assets.imagesWhiteLogo
          : Assets.imagesBlackLogo,
      width: size, height: size,
    );
  }
}
