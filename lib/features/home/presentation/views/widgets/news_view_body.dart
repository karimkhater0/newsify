import 'package:flutter/material.dart';
import 'package:newsify/core/styles.dart';
import 'package:newsify/features/home/data/news_model.dart';
import 'package:newsify/features/home/presentation/views/widgets/news_source_info_widget.dart';

import 'news_article_image.dart';
import 'news_content_widget.dart';

class NewsViewBody extends StatelessWidget {
  const NewsViewBody({super.key, required this.model});

  final Results model;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NewsArticleImage(imgUrl:model.imageUrl?? '',),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
            child: Column(
              children: [
                Text(
                    model.title!,
                    textAlign: TextAlign.start,
                    style: Styles.tsArticleTitle
                ),
      
                SourceInfoWidget(model: model,),

                NewsContentWidget(text: model.description!, url: model.link!),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

