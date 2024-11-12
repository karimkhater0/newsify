import 'package:flutter/material.dart';

class ScreenPadding extends StatelessWidget {
  const ScreenPadding({super.key, required this.child, this.h, this.v});

  final Widget child;
  final double? h, v;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h ?? 16.0,vertical: v ?? 22),
      child: child,
    );
  }
}
