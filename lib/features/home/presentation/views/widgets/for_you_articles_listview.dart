import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/home_cubit/home_cubit.dart';
import 'for_you_article_item.dart';

class ForYouArticlesListView extends StatelessWidget {
  const ForYouArticlesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).category_all,
            style: Styles.tsH1Medium,
          ),
          const SizedBox(height: 10,),
          BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                var cubit = HomeCubit.get(context);
                return SizedBox(
                  height: 380,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.homeNews.length,
                    itemBuilder: (context, index) => ForYouArticleItem(
                      model: cubit.homeNews[index],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(width: 10,),

                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}
