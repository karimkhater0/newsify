import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/cache_helper.dart';
import '../../../../../core/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text, required this.isTransparent,
    required this.onPressed});

  final String text;
  final bool isTransparent;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    bool isDark = CacheHelper.getData(key: 'isDark');
    Color color = isDark ? kWhite : kBlack;
    return Container(
      height: 50,
      constraints: BoxConstraints(
        minWidth: MediaQuery.sizeOf(context).width * .5,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        color: isTransparent ? Colors.transparent : color,
        border: Border.all(color: color),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.tsH3Medium.copyWith(
            color: isTransparent
                ? color
                : isDark
                ? kBlack
                : kWhite,
          ),
        ),
      ),
    );
  }
}
