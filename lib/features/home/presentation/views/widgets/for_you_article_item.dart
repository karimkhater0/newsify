import 'package:flutter/material.dart';
import 'package:newsify/core/utils/functions/navigation_functions.dart';
import 'package:newsify/features/home/presentation/views/news_view.dart';

import '../../../../../core/styles.dart';
import '../../../data/news_model.dart';
import 'for_you_container_decoration.dart';
import 'news_article_image.dart';
import 'news_article_info_row.dart';

class ForYouArticleItem extends StatelessWidget {
  const ForYouArticleItem({super.key, required this.model});

  final Results model;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        navigateTo(context, NewsView(model: model));
      },
      child: ForYouContainerDecoration(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: NewsArticleImage(
                    imgUrl:model.imageUrl?? '', width: 300,
                  )
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: Styles.tsArticleTitle,
                    ),
                    Text(
                      model.sourceName ?? '',
                      maxLines: 1,

                      overflow: TextOverflow.ellipsis,
                      style: Styles.tsImageCaption,
                    ),
                    NewsArticleInfoRow(model: model,),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}

