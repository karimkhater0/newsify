import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/features/home/presentation/views/widgets/empty_list_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../manager/home_cubit/home_cubit.dart';
import 'news_article_item.dart';

class NewsArticleListView extends StatelessWidget {
  const NewsArticleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      var cubit = HomeCubit.get(context);
      var list = cubit.categoryNews;
      return Skeletonizer(
        enabled: state is HomeGetCategoryLoadingState,
        child: ConditionalBuilder(
          condition: list.isNotEmpty && state is !HomeGetCategoryLoadingState,
          builder: (context) => ListView.separated(
            itemCount: list.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => NewsArticleItem(
              model: list[index],
            ),
            separatorBuilder: (context, index) => const Divider(),
          ),
          fallback: (context) => const EmptyListWidget(),
        ),
      );
    });
  }
}
