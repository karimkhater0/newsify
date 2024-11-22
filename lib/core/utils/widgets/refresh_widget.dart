import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:newsify/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:newsify/features/home/presentation/views/widgets/custom_progress_indicator.dart';

import '../../../constants.dart';
import '../../../features/home/presentation/manager/home_cubit/home_cubit.dart';
import '../../../generated/l10n.dart';
import '../functions/check_internet_connection.dart';

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          return LiquidPullToRefresh(
            onRefresh: cubit.onRefresh,
            showChildOpacityTransition: false,
            color: Colors.transparent,
            backgroundColor: kGrey,
            animSpeedFactor: 5,
            child: ConditionalBuilder(
              condition: state is !HomeGetCategoryErrorState
                  && state is !HomeGetNewsErrorState,
              builder: (context) => child,
              fallback: (context)  => CheckConnectionWidget(
                onRefresh: cubit.onRefresh,
              ),

            ),
          );
        }
    );
  }
}

class CheckConnectionWidget extends StatelessWidget {
  const CheckConnectionWidget({super.key, required this.onRefresh});

  final void Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: checkInternetConnection(),
        builder: (context, snapshot){
          // Check if there’s an error in fetching data or if connection is down
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && !snapshot.data!) {
              // No internet connection
              return CustomErrorWidget(
                message: S.of(context).no_internet,
                onRefresh: onRefresh,
              );
            }
            else if(snapshot.hasData && snapshot.data!){
              // Internet connection available
              return CustomErrorWidget(
                  onRefresh: onRefresh,
                  message: S.of(context).error
              );
            }
          }

          // Show loading indicator while the future completes
          return const CustomProgressIndicator();
        },
    );
  }
}
