import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DismissibleBackgroundWidget extends StatelessWidget {
  const DismissibleBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(child: Icon(IconlyBold.delete)),
    );
  }
}
