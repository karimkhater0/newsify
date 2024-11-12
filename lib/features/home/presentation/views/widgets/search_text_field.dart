import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/home_cubit/home_cubit.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SizedBox(
          height: 45,
          child: TextField(
            controller: cubit.searchController,
            onChanged: (value){},
            onSubmitted: (value){
              cubit.getSearchNews(value);
            },
            style: Styles.tsP1Regular.copyWith(color: kBlack),
            cursorColor: kGrey,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                fillColor: kGreyLight,
                filled: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  borderSide: BorderSide.none,
                ),
                hintText: S.of(context).search,
                hintStyle: Styles.tsP1Regular.copyWith(
                  color: kGrey,
                ),
                prefixIcon: const Icon(IconlyLight.search,color: kGrey,size: 17,),
                suffixIcon: IconButton(
                  icon: const Icon(IconlyLight.close_square,color: kBlack,size: 20,),
                  onPressed: (){
                    cubit.searchController.clear();
                    FocusScope.of(context).unfocus();
                  },

                )
            ),
          ),
        );
      }
    );
  }
}
