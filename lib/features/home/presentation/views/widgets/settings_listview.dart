
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:newsify/core/utils/functions/navigation_functions.dart';
import 'package:newsify/features/home/presentation/manager/localization_cubit/localization_cubit.dart';
import 'package:newsify/features/home/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:newsify/features/home/presentation/views/interests_view.dart';
import 'package:newsify/features/home/presentation/views/widgets/settings_about_view_body.dart';
import 'package:newsify/features/home/presentation/views/widgets/settings_item.dart';
import 'package:newsify/features/home/presentation/views/widgets/settings_terms_conditions_view_body.dart';

import '../../../../../core/utils/functions/show_sheet_menu.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/settings_model.dart';
import '../../../data/settings_sheet_menu_model.dart';
import 'custom_divider.dart';

class SettingsListView extends StatelessWidget {
  const SettingsListView({super.key});

  @override
  Widget build(BuildContext context) {

    final List<SettingsModel> list = [
      SettingsModel(
        title: S.of(context).interests,
        icon: Icons.interests,
        onTap: () {
          navigateTo(context, const InterestsView());
        },
      ),
      SettingsModel(
        title: S.of(context).language,
        icon: Icons.language,
        onTap: () {
          showSettingsSheetMenu(
            context,
            [
              SettingsSheetMenuModel(
                  title: 'English',
                  onSelected: (){
                    context.read<LocalizationCubit>().changeLocale('en');
                  }
              ),
              SettingsSheetMenuModel(
                  title: 'عربي',
                  onSelected: (){
                    context.read<LocalizationCubit>().changeLocale('ar');
                  }
              ),
            ],
          );
        },
      ),
      SettingsModel(
        title: S.of(context).dark_mode,
        icon: Icons.dark_mode_outlined,
        onTap: () {
          showSettingsSheetMenu(
            context,
            [
              SettingsSheetMenuModel(
                  title: S.of(context).dark,
                  icon: Icons.dark_mode_outlined,
                  onSelected: (){

                    context.read<ThemeCubit>().toggleTheme(true);
                  }
              ),
              SettingsSheetMenuModel(
                  title: S.of(context).light,
                  icon: Icons.light_mode_rounded,
                  onSelected: (){
                    context.read<ThemeCubit>().toggleTheme(false);
                  }
              ),
            ],
          );
        },
      ),
      SettingsModel(
        title: S.of(context).terms_conditions,
        icon: Icons.help_outline_rounded,
        onTap: () {
          navigateTo(context, const TermsAndConditionsViewBody());
        },
      ),
      SettingsModel(
        title: '${S.of(context).about} ${S.of(context).title}',
        icon: IconlyLight.info_circle,
        onTap: () {
          navigateTo(context, const AboutViewBody());
        },
      ),
    ];
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: list.length,
        separatorBuilder: (context, index) => const CustomDivider(topPadding: 0,),
        itemBuilder: (context, index) => SettingsItem(
          title: list[index].title,
          icon: list[index].icon,
          onTap: list[index].onTap,
        ),
      ),
    );
  }
}
