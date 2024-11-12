import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/core/utils/functions/navigation_functions.dart';
import 'package:newsify/features/home/presentation/views/home_view.dart';
import 'package:newsify/features/home/presentation/views/widgets/custom_divider.dart';
import 'package:newsify/features/home/presentation/views/widgets/custom_title.dart';
import 'package:newsify/features/onboarding/presentation/views/widgets/custom_button.dart';

import '../../../../../core/cache_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/home_cubit/home_cubit.dart';
import 'interests_item_widget.dart';

class InterestsViewBody extends StatelessWidget {
  const InterestsViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    List<String> interests = [
      S.of(context).category_business,
      S.of(context).category_entertainment,
      S.of(context).category_health,
      S.of(context).category_tourism,
      S.of(context).category_science,
      S.of(context).category_sports,
      S.of(context).category_technology,
      S.of(context).category_politics,
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          CustomTitle(title: S.of(context).interests),

          /// Interests
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: interests.length,
              itemBuilder: (context, index) => InterestsItemWidget(
                text: interests[index], index: index,
              ),
              separatorBuilder: (context, index) => const CustomDivider(
                topPadding: 5, bottomPadding: 10,
              ),

            ),
          ),

          /// Confirm Button
          Align(
            alignment: Alignment.center,
            child: CustomButton(
                text: S.of(context).confirm,
                isTransparent: false,
                onPressed: ()async{
                  await context.read<HomeCubit>().setSelectedInterests();
                  CacheHelper.saveData(key: 'chooseInterests', value: true);
                  navigateAndFinish(
                      context,
                      BlocProvider(
                        create: (context) => HomeCubit()
                          ..getNews()
                          ..getCategorizedNews('business'),
                        child: const HomeView()
                      )
                  );

                }
            ),
          ),


        ],
      ),
    );
  }
}

