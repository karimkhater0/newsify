import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newsify/features/splash/splash_view.dart';

import 'bloc_observer.dart';
import 'core/cache_helper.dart';
import 'core/dio_helper.dart';
import 'features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'features/home/presentation/manager/localization_cubit/localization_cubit.dart';
import 'features/home/presentation/manager/theme_cubit/theme_cubit.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  await HomeCubit().initializeDatabase();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit()..getTheme()
        ),
        BlocProvider<LocalizationCubit>(
            create: (context) => LocalizationCubit()..getLocale()
        ),
        BlocProvider<HomeCubit>(
            create: (context) => HomeCubit()
              ..loadArticles()
              ..getNews()
              ..getCategorizedNews('business')
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return BlocBuilder<LocalizationCubit, LocaleState>(
              builder: (context, localeState) {
                return MaterialApp(
                  locale: Locale(localeState.languageCode),
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  debugShowCheckedModeBanner: false,
                  title: 'Newsify',
                  theme: themeState.themeData,
                  home: const SplashView() //widget,
                );
              }
            );
          }
      ),
    );

  }
}
