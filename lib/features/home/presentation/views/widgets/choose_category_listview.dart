import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import 'choose_category_item.dart';

class ChooseCategoryListView extends StatelessWidget {
  const ChooseCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      S.of(context).category_business,
      S.of(context).category_entertainment,
      S.of(context).category_health,
      S.of(context).category_tourism,
      S.of(context).category_science,
      S.of(context).category_sports,
      S.of(context).category_technology,
      S.of(context).category_politics,
      S.of(context).category_top,
      S.of(context).category_world,
    ];

    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ChooseCategoryItem(
          category: categories[index],
          index: index,
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10,),
      ),
    );
  }
}
