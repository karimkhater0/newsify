import 'package:flutter/material.dart';

class SettingsSheetMenuModel {
  final String title;
  final IconData? icon;
  final void Function() onSelected;
  SettingsSheetMenuModel({required this.title, this.icon, required this.onSelected});
}