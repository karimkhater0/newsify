import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:newsify/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../generated/l10n.dart';
import '../../../data/news_model.dart';
import 'menu_item.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.model});

  final Results model;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return PopupMenuButton(
          onSelected: (value)async{
            if(value == S.of(context).share)
            {
              if(model.link != null && model.link != ''){
                Share.share(model.link!);
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No link available'),));
              }
            }
            else if(value == S.of(context).save)
            {
              cubit.archiveArticle(model);
            }
          },
          shape: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none
          ),

          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              value: S.of(context).share,
              child: MenuItem(
                title: S.of(context).share,icon: Icons.ios_share_rounded,),
            ),
            PopupMenuItem(
              value: S.of(context).save,
              child: MenuItem(
                title: cubit.isArchived(model)
                    ? S.of(context).unsave
                    : S.of(context).save,
                icon: cubit.isArchived(model)
                    ? IconlyBold.bookmark
                    : IconlyLight.bookmark,

              ),
            ),
          ],
          child: const Icon(Icons.more_horiz_rounded),
        );
      }
    );
  }
}
