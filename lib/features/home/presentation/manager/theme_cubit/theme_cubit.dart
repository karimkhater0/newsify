
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cache_helper.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static final ThemeData lightTheme = ThemeData.light();
  static final ThemeData darkTheme = ThemeData.dark();
  ThemeCubit() : super(ThemeState(lightTheme));

  static ThemeCubit get(context) => BlocProvider.of(context);
  toggleTheme(bool isDark)
  {
    final themeData = isDark ? darkTheme : lightTheme;
    emit(ThemeState(themeData));
    CacheHelper.saveData(key: 'isDark', value: isDark);
  }


  Future<void> getTheme()async
  {
    final isDark = await CacheHelper.getData(key: 'isDark')
        ?? WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    toggleTheme(isDark);
  }




}
