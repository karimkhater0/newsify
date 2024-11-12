import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles.dart';
import '../../../../../core/utils/functions/get_time_ago.dart';
import '../../../data/news_model.dart';

class SourceInfoWidget extends StatelessWidget {
  const SourceInfoWidget({super.key, required this.model});

  final Results model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(model.sourceIcon ?? ''),
            backgroundColor: kGrey,
          ),
          const SizedBox(width: 10,),
          Text(
            model.sourceName!,
            style: Styles.tsH3Medium,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Text(
            getTimeAgo(model.pubDate!),
            style: Styles.tsH3Medium,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
