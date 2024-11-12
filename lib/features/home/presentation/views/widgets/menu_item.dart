import 'package:flutter/material.dart';

import '../../../../../core/styles.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(icon),
        const SizedBox(width: 10,),
        Text(
          title,
          style: Styles.tsH3Medium,
        ),
      ],
    );
  }
}
