import 'package:flutter/material.dart';
import 'package:newsify/features/home/presentation/views/interests_view.dart';

import '../../../../../core/cache_helper.dart';
import '../../../../../core/utils/functions/navigation_functions.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/onboarding_cubit/onboarding_cubit.dart';
import 'custom_button.dart';

class OnboardingButtons extends StatelessWidget {
  const OnboardingButtons({super.key, required this.boardController, required this.cubit});

  final PageController boardController;
  final OnboardingCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
                text: S.of(context).skip,
                isTransparent: true,
                onPressed: (){
                  CacheHelper.saveData(key: 'onBoarding', value: true);
                  navigateAndFinish(
                      context,
                      const InterestsView(),
                  );
                }
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: CustomButton(
                text: S.of(context).next,
                isTransparent: false,
                onPressed: (){
                  if (cubit.isLast) {
                    CacheHelper.saveData(key: 'onBoarding', value: true);
                    navigateAndFinish(
                        context,
                        const InterestsView(),
                    );
                  }
                  else {
                    boardController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  }
                }
            ),
          ),
        ],
      ),
    );
  }
}
