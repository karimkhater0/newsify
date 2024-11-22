import 'package:flutter/material.dart';

import '../../../../../core/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.onRefresh, required this.message});

  final void Function() onRefresh;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          textAlign: TextAlign.center,
          style: Styles.tsP1Regular,

        ),
        const SizedBox(height: 5,),
        IconButton(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh_rounded,size: 40,)),
      ],
    );
  }
}
