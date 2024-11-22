import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).no_data,
    );
  }
}
