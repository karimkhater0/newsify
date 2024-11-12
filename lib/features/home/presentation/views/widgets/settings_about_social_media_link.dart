import 'package:flutter/material.dart';

class SocialMediaLink extends StatelessWidget {
  final String platform;
  final String handle;
  final IconData icon;
  final VoidCallback onTap;

  const SocialMediaLink({
    super.key,
    required this.platform,
    required this.handle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(platform),
      subtitle: Text(handle),
      onTap: onTap,
    );
  }
}
