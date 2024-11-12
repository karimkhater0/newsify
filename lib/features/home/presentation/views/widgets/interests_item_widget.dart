import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles.dart';
import '../../manager/home_cubit/home_cubit.dart';

class InterestsItemWidget extends StatelessWidget {
  const InterestsItemWidget({super.key, required this.text, required this.index,});

  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.read<HomeCubit>().isDark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Styles.tsH2Medium,
        ),
        BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              var cubit = HomeCubit.get(context);
              final isSelected = cubit.isInterestSelected(cubit.categories[index]);
              return Switch(
                value: isSelected,
                activeTrackColor: isDark ? kWhite : kBlack,
                activeColor: isDark ? kBlack : kWhite,
                onChanged: (value){
                  cubit.toggleInterest(cubit.interestsList[index].interest);
                },
              );
            }
        )
      ],
    );
  }
}
