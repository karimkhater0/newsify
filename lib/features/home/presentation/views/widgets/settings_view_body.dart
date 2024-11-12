import 'package:flutter/material.dart';
import 'package:newsify/features/home/presentation/views/widgets/settings_listview.dart';

import '../../../../../generated/l10n.dart';
import 'custom_title.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CustomTitle(title: S.of(context).settings),

        const SizedBox(height: 30),
        const SettingsListView(),
      ],
    );
  }
}



