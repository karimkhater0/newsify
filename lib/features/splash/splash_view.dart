import 'package:flutter/material.dart';
import 'package:newsify/core/styles.dart';
import 'package:newsify/core/utils/functions/navigation_functions.dart';
import 'package:newsify/features/home/presentation/views/interests_view.dart';
import 'package:newsify/features/onboarding/presentation/views/onboarding_view.dart';

import '../../core/cache_helper.dart';
import '../../core/utils/widgets/app_logo.dart';
import '../home/presentation/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Widget nextPage()
  {
    bool? onBoarding =  CacheHelper.getData(key: 'onBoarding');
    bool? interests =  CacheHelper.getData(key: 'chooseInterests');

    if (onBoarding == true)
    {
      if(interests == true)
        {
          return const HomeView();
        }
      return const InterestsView();
    }

    return const OnboardingView();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      navigateAndFinish(context, nextPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(),
            const SizedBox(height: 20,),
            const Text('Newsify', style: Styles.tsArticleTitle,),
          ],
        ),
      ),
    );
  }
}
