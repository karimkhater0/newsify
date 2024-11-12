import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../data/news_model.dart';
import '../../manager/home_cubit/home_cubit.dart';

class NewsSaveButton extends StatelessWidget {
  const NewsSaveButton({super.key, required this.model});

  final Results model;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          bool isArchived = cubit.isArchived(model);
          return IconButton(
            onPressed: (){
              cubit.archiveArticle(model);
            },
            icon: Icon(
              isArchived
                  ? IconlyBold.bookmark
                  : IconlyLight.bookmark,
            ),
          );
        }
    );
  }
}
