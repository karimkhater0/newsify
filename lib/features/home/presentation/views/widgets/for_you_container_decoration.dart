import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/cache_helper.dart';

class ForYouContainerDecoration extends StatelessWidget {
  const ForYouContainerDecoration({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final bool isDark = CacheHelper.getData(key: 'isDark');
    return Container(
      width: 300,
      height: 380,
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: isDark ? Colors.black : kGreyLight,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          isDark
              ? kDarkBoxShadow
              : const BoxShadow(),
        ],
      ),
      child: child,
    );
  }
}
