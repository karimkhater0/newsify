
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  bool isLast = false;
  void changeOnBoardingPage(int index,) {
    if (index == 2) {
      isLast = true;
      emit(ChangeOnBoardingState());

    }
    else {
      isLast = false;
      emit(ChangeOnBoardingState());
    }
  }
}
