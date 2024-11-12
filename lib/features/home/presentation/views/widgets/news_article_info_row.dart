import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles.dart';
import '../../../../../core/utils/functions/get_time_ago.dart';
import '../../../data/news_model.dart';
import 'menu_button.dart';

class NewsArticleInfoRow extends StatelessWidget {
  const NewsArticleInfoRow({super.key, required this.model});

  final Results model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          model.category?[0] ?? '',
          style: Styles.tsH3Bold
              .copyWith(color: const Color(0xff69BDFD)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 9),
          child: CircleAvatar(
            radius: 3,
            backgroundColor: kGrey,
          ),
        ),
        Expanded(
          child: Text(
            getTimeAgo(model.pubDate!),
            overflow: TextOverflow.ellipsis,
            style: Styles.tsH3Medium,
          ),
        ),
        MenuButton(model: model,),
      ],
    );
  }
}
