import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/utils/functions/is_arabic.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        isArabic()
            ? IconlyLight.arrow_right_2
            : IconlyLight.arrow_left_2,
      ),
    );
  }
}
