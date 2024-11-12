import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.topPadding, this.bottomPadding});

  final double? topPadding, bottomPadding;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: topPadding ?? 30.0, bottom: bottomPadding ?? 20),
      child: const Divider(),
    );
  }
}
