import 'package:flutter/material.dart';
import 'package:newsify/core/utils/functions/navigation_functions.dart';
import 'package:newsify/features/home/presentation/views/news_view.dart';

import '../../../../../core/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/news_model.dart';
import 'news_article_image.dart';
import 'news_article_info_row.dart';

class NewsArticleItem extends StatelessWidget {
  const NewsArticleItem({super.key, required this.model});

  final Results model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, NewsView(model: model));
      },
      child: SizedBox(
        height: 140,
        width: double.infinity,
        child: Row(
          children: [
            /// Image
            NewsArticleImage(imgUrl:model.imageUrl?? '', width:140, height:140),

            const SizedBox(width: 10,),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      model.title!,
                      style: Styles.tsH2Bold,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${S.of(context).source}: ${model.sourceName}',
                    overflow: TextOverflow.ellipsis,
                    style: Styles.tsH3Medium,
                  ),
                  NewsArticleInfoRow(model: model,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


