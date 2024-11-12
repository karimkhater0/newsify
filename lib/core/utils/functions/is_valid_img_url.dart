import 'package:flutter/material.dart';

Future<bool> isValidImageUrl(String? url) async {
  if (url == null || url.isEmpty) return false;

  // Regular expression to validate basic URL structure
  final urlPattern = RegExp(r"^(http|https):\/\/[^\s]+$");
  if (!urlPattern.hasMatch(url)) return false;

  try {
    // Check if the URL is valid by attempting to obtain the key
    final  response = await NetworkImage(url).obtainKey(const ImageConfiguration());
    return response != null;
  } catch (_) {
    return false;
  }
}
