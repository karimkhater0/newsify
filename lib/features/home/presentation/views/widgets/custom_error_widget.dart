import 'package:flutter/material.dart';

import '../../../../../core/styles.dart';
import '../../../../../generated/l10n.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          S.of(context).error,
          textAlign: TextAlign.center,
          style: Styles.tsP1Regular,

        )
    );
  }
}
