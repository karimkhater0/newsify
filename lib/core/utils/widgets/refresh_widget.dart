import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:newsify/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../constants.dart';
import '../../../features/home/presentation/manager/home_cubit/home_cubit.dart';

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          Future<void> onRefresh()async{
            cubit.changeCategory(cubit.currentCategoryIndex);
          }
          return LiquidPullToRefresh(
            onRefresh: onRefresh,
            showChildOpacityTransition: false,
            color: Colors.transparent,
            backgroundColor: kGrey,
            animSpeedFactor: 5,

            child: Skeletonizer(
              enabled: state is HomeGetNewsLoadingState,
              child: ConditionalBuilder(
                condition: state is !HomeGetCategoryErrorState,
                builder: (context) => child,
                fallback: (context) => const CustomErrorWidget(),

              ),
            ),
          );
        }
    );
  }
}
