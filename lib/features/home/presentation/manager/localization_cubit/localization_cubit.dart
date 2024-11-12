import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cache_helper.dart';

part 'localization_state.dart';


class LocalizationCubit extends Cubit<LocaleState> {

  LocalizationCubit() : super(LocaleState(languageCode: window.locale.languageCode));

  static LocalizationCubit get(context) => BlocProvider.of(context);

  // Method to load saved locale from SharedPreferences
  changeLocale(String languageCode) async {
    emit(LocaleState(languageCode: languageCode));
    CacheHelper.saveData(key: 'lang', value: languageCode);
  }

  // Method to update and save the locale
  Future<void> getLocale() async {
    var languageCode = CacheHelper.getData(key: 'lang')
        ?? window.locale.languageCode;
    changeLocale(languageCode);
  }
}
