import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/refresh_widget.dart';
import '../../../../../generated/l10n.dart';
import 'choose_category_listview.dart';
import 'custom_title.dart';
import 'for_you_articles_listview.dart';
import 'news_article_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return RefreshWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTitle(title: S.of(context).title,),
              const ForYouArticlesListView(),
              const ChooseCategoryListView(),
              const NewsArticleListView(),
            ],
          ),
        ),
    );
  }
}



