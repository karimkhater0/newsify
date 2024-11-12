import 'package:flutter/material.dart';
import 'package:newsify/features/home/presentation/views/widgets/interests_view_body.dart';

class InterestsView extends StatelessWidget {
  const InterestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.0),
        child: InterestsViewBody(),
      )),
    );
  }
}
