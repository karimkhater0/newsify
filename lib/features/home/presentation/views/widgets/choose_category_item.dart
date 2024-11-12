import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/cache_helper.dart';
import '../../../../../core/styles.dart';
import '../../manager/home_cubit/home_cubit.dart';

class ChooseCategoryItem extends StatelessWidget {
  const ChooseCategoryItem({super.key, required this.category, required this.index});

  final String category;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          bool isDark = CacheHelper.getData(key: 'isDark');
          bool isChosen = cubit.currentCategoryIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child:  InkWell(
              onTap: (){
                cubit.changeCategory(index);
              },
              child: Chip(
                label: Text(
                  category,
                  style: Styles.tsH2Medium.copyWith(
                    color: isChosen
                        ? isDark ? kBlack : kWhite
                        : isDark ? kGreyLight : kGrey,
                  ),
                ),
                backgroundColor: isChosen
                    ? isDark ? kWhite : kBlack
                    : isDark ? kGrey : kGreyLight,
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),

          );
        }
    );
  }
}
