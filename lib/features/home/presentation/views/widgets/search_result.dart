import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/home_cubit/home_cubit.dart';
import 'custom_error_widget.dart';
import 'custom_progress_indicator.dart';
import 'news_article_item.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key,});



  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          switch(state)
          {
            case SearchNewsSuccessState _:
              return ListView.separated(
                itemCount: cubit.searchNews.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => NewsArticleItem(
                  model: cubit.searchNews[index],
                ),

              );

            case SearchNewsErrorState _:
              return const CustomErrorWidget();

            case SearchNewsLoadingState _:
              return const CustomProgressIndicator();

            default:
              return const SizedBox();
          }

        },
      ),
    );


  }
}
