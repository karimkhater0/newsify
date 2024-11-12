import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/home_cubit/home_cubit.dart';
import 'custom_error_widget.dart';
import 'news_article_item.dart';

class NewsArticleListView extends StatelessWidget {
  const NewsArticleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      var cubit = HomeCubit.get(context);
      var list = cubit.categoryNews;
      return ConditionalBuilder(
          condition: state is HomeGetCategoryErrorState,
          builder: (context) => const CustomErrorWidget(),
          fallback: (context) =>ListView.separated(
            itemCount: list.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => NewsArticleItem(
              model: list[index],
            ),
            separatorBuilder: (context, index) => const Divider(),
          ),
      );
    });
  }
}
