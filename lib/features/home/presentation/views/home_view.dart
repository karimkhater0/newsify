import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/core/utils/widgets/screen_padding.dart';
import 'package:newsify/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:newsify/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          body: SafeArea(
              child: ScreenPadding(
                  child: cubit.screens[cubit.currentIndex],
              )
          ),

          bottomNavigationBar: CustomBottomNavBar(cubit: cubit),
        );
      }
    );
  }
}

