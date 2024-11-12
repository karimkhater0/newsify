import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles.dart';
import '../../../../../core/utils/functions/is_arabic.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({super.key, required this.icon, required this.title, this.onTap});

  final IconData icon;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(title,style: Styles.tsH2Medium,overflow: TextOverflow.ellipsis,),
            const Spacer(),
            isArabic()
                ? const Icon(
              IconlyLight.arrow_left_2,
              color: kGrey,
              size: 20,
            )
                : const Icon(
              IconlyLight.arrow_right_2,
              color: kGrey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
