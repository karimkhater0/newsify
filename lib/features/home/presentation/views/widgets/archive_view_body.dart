import 'package:flutter/material.dart';
import 'package:newsify/features/home/presentation/views/widgets/custom_title.dart';

import '../../../../../generated/l10n.dart';
import 'archive_listview.dart';

class ArchiveViewBody extends StatelessWidget {
  const ArchiveViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(title: S.of(context).archive),

        const ArchiveListView(),
      ],
    );
  }
}
