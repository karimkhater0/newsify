import 'package:flutter/material.dart';

import '../../../features/home/data/settings_sheet_menu_model.dart';

void showSettingsSheetMenu(context, List<SettingsSheetMenuModel> list)
{
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: list
            .map(
              (index) => ListTile(
            leading: Icon(index.icon),
            title: Text(index.title),
            onTap: () {
              index.onSelected();
              Navigator.pop(context);
            },
          ),
        )
            .toList(),
      );
    },
  );
}