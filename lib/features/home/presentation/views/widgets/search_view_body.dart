import 'package:flutter/material.dart';
import 'package:newsify/features/home/presentation/views/widgets/search_result.dart';
import 'package:newsify/features/home/presentation/views/widgets/search_text_field.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchTextField(),

        SizedBox(height: 30,),

        SearchResult(),
      ],
    );
  }
}

