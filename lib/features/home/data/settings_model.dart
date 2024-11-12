import 'package:flutter/cupertino.dart';

class SettingsModel
{
  final String title;
  final IconData icon;
  final void Function()? onTap;

  SettingsModel({required this.title, required this.icon, this.onTap});
}