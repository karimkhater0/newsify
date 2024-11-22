import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../manager/home_cubit/home_cubit.dart';
import 'news_article_item.dart';

class ArchiveListView extends StatelessWidget {
  const ArchiveListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return ConditionalBuilder(
              condition: cubit.archivedNews.isNotEmpty,
              builder: (context) =>ListView.separated(
                itemCount: cubit.archivedNews.length,
                itemBuilder: (context ,index) => NewsArticleItem(
                  model: cubit.archivedNews[index],
                ),
                separatorBuilder: (context, index) => const Divider(),

              ),
              fallback: (context) => Center(child: Text(S.of(context).no_archive)),
            );
          }
      ),
    );
  }
}
