import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/features/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';

import '../../../../../generated/l10n.dart';
import '../../../data/onboarding_model.dart';
import 'onboarding_buttons.dart';
import 'onboarding_img_widget.dart';
import 'onboarding_item.dart';

class OnboardingViewBody extends StatelessWidget {
  OnboardingViewBody({super.key});

  final boardController = PageController();
  @override
  Widget build(BuildContext context) {
    final List<OnboardingModel> boarding = [
      OnboardingModel(
        title: S.of(context).onboarding_title1,
        body: S.of(context).onboarding_body1,
      ),
      OnboardingModel(
        title:S.of(context).onboarding_title2 ,
        body: S.of(context).onboarding_body2,
      ),
      OnboardingModel(
        title: S.of(context).onboarding_title3,
        body: S.of(context).onboarding_body3,
      ),

    ];

    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          var cubit = OnboardingCubit.get(context);
          return Column(
            children: [
              const OnboardingImageWidget(),

              Expanded(
                child: PageView.builder(
                  itemCount: boarding.length,
                  controller: boardController,
                  onPageChanged: (index) {
                    cubit.changeOnBoardingPage(index);
                  },
                  itemBuilder: (context, index) => OnboardingItem(
                      model: boarding[index]
                  ),

                ),
              ),

              OnboardingButtons(cubit: cubit, boardController: boardController,),
            ],
          );
        }
      ),
    );
  }
}




