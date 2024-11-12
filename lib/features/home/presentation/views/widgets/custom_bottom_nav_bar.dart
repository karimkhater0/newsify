import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:newsify/constants.dart';
import 'package:newsify/core/cache_helper.dart';

import '../../../../../generated/l10n.dart';
import '../../manager/home_cubit/home_cubit.dart';
import '../../manager/theme_cubit/theme_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.cubit});

  final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context,state) {
        return BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.changeBottomNavBar(index);
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: CacheHelper.getData(key: 'isDark') ? kGreyLight :kBlack,
          items:  [
            BottomNavigationBarItem(
              icon: const Icon(IconlyLight.home),
              label: S.of(context).home,
              activeIcon: const Icon(IconlyBold.home),

            ),
            BottomNavigationBarItem(
              icon: const Icon(IconlyLight.search),
              label: S.of(context).search,
              activeIcon: const Icon(IconlyBold.search),
            ),
            BottomNavigationBarItem(
              icon: const Icon(IconlyLight.bookmark),
              label: S.of(context).archive,
              activeIcon: const Icon(IconlyBold.bookmark),
            ),
            BottomNavigationBarItem(
              icon: const Icon(IconlyLight.setting),
              label: S.of(context).settings,
              activeIcon: const Icon(IconlyBold.setting),
            ),
          ],

        );
      }
    );
  }
}
