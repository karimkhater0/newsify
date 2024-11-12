import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }



  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  })async
  {
    if(value is String) return await sharedPreferences.setString(key, value);
    if(value is int) return await sharedPreferences.setInt(key, value);
    if(value is double) return await sharedPreferences.setDouble(key, value);

    return await sharedPreferences.setBool(key, value);
  }

  static Future<bool> saveList({
    required String key,
    required List<String> list,
  })async
  {
    return await sharedPreferences.setStringList(key, list);
  }

  static List<String> getList({
    required String key,
  })
  {
    debugPrint(sharedPreferences.getStringList(key)?.toString());
    return sharedPreferences.getStringList(key) ?? [];
  }


  static Future<bool> removeData(
  {
    required String key,
  })async
  {
    return await sharedPreferences.remove(key);
  }
}