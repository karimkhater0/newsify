// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Newsify`
  String get title {
    return Intl.message(
      'Newsify',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Explore News by Categories`
  String get onboarding_title1 {
    return Intl.message(
      'Explore News by Categories',
      name: 'onboarding_title1',
      desc: '',
      args: [],
    );
  }

  /// `Read Anytime, Anywhere`
  String get onboarding_title2 {
    return Intl.message(
      'Read Anytime, Anywhere',
      name: 'onboarding_title2',
      desc: '',
      args: [],
    );
  }

  /// `Find What You’re Looking For`
  String get onboarding_title3 {
    return Intl.message(
      'Find What You’re Looking For',
      name: 'onboarding_title3',
      desc: '',
      args: [],
    );
  }

  /// `Discover a wide range of topics that interest you! From technology to sports, select your favorite categories and stay updated on the news that matters most to you.`
  String get onboarding_body1 {
    return Intl.message(
      'Discover a wide range of topics that interest you! From technology to sports, select your favorite categories and stay updated on the news that matters most to you.',
      name: 'onboarding_body1',
      desc: '',
      args: [],
    );
  }

  /// `Save articles to read offline, even when you’re not connected to the internet. Catch up on your favorite stories at your convenience!`
  String get onboarding_body2 {
    return Intl.message(
      'Save articles to read offline, even when you’re not connected to the internet. Catch up on your favorite stories at your convenience!',
      name: 'onboarding_body2',
      desc: '',
      args: [],
    );
  }

  /// `Quickly search for specific topics, events, or stories. Our search feature makes it easy to find exactly what you need from our wide selection of articles.`
  String get onboarding_body3 {
    return Intl.message(
      'Quickly search for specific topics, events, or stories. Our search feature makes it easy to find exactly what you need from our wide selection of articles.',
      name: 'onboarding_body3',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get next {
    return Intl.message(
      'Continue',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Interests`
  String get interests {
    return Intl.message(
      'Interests',
      name: 'interests',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get archive {
    return Intl.message(
      'Archive',
      name: 'archive',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get settings {
    return Intl.message(
      'Setting',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terms_conditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Source`
  String get source {
    return Intl.message(
      'Source',
      name: 'source',
      desc: '',
      args: [],
    );
  }

  /// `For You`
  String get category_all {
    return Intl.message(
      'For You',
      name: 'category_all',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get category_business {
    return Intl.message(
      'Business',
      name: 'category_business',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get category_entertainment {
    return Intl.message(
      'Entertainment',
      name: 'category_entertainment',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get category_health {
    return Intl.message(
      'Health',
      name: 'category_health',
      desc: '',
      args: [],
    );
  }

  /// `Science`
  String get category_science {
    return Intl.message(
      'Science',
      name: 'category_science',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get category_sports {
    return Intl.message(
      'Sports',
      name: 'category_sports',
      desc: '',
      args: [],
    );
  }

  /// `Technology`
  String get category_technology {
    return Intl.message(
      'Technology',
      name: 'category_technology',
      desc: '',
      args: [],
    );
  }

  /// `Politics`
  String get category_politics {
    return Intl.message(
      'Politics',
      name: 'category_politics',
      desc: '',
      args: [],
    );
  }

  /// `Top`
  String get category_top {
    return Intl.message(
      'Top',
      name: 'category_top',
      desc: '',
      args: [],
    );
  }

  /// `World`
  String get category_world {
    return Intl.message(
      'World',
      name: 'category_world',
      desc: '',
      args: [],
    );
  }

  /// `Tourism`
  String get category_tourism {
    return Intl.message(
      'Tourism',
      name: 'category_tourism',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Unsave`
  String get unsave {
    return Intl.message(
      'Unsave',
      name: 'unsave',
      desc: '',
      args: [],
    );
  }

  /// `...read more`
  String get read_more {
    return Intl.message(
      '...read more',
      name: 'read_more',
      desc: '',
      args: [],
    );
  }

  /// `You haven't archived any news yet.`
  String get no_archive {
    return Intl.message(
      'You haven\'t archived any news yet.',
      name: 'no_archive',
      desc: '',
      args: [],
    );
  }

  /// `We’re having trouble retrieving data at the moment. Please try again later.`
  String get error {
    return Intl.message(
      'We’re having trouble retrieving data at the moment. Please try again later.',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get no_data {
    return Intl.message(
      'No Data',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get no_internet {
    return Intl.message(
      'No Internet Connection',
      name: 'no_internet',
      desc: '',
      args: [],
    );
  }

  /// `our Mission`
  String get our_mission_title {
    return Intl.message(
      'our Mission',
      name: 'our_mission_title',
      desc: '',
      args: [],
    );
  }

  /// `Newsify is committed to delivering accurate, timely, and relevant news to keep you informed about what matters most.`
  String get our_mission_body {
    return Intl.message(
      'Newsify is committed to delivering accurate, timely, and relevant news to keep you informed about what matters most.',
      name: 'our_mission_body',
      desc: '',
      args: [],
    );
  }

  /// `Features`
  String get features {
    return Intl.message(
      'Features',
      name: 'features',
      desc: '',
      args: [],
    );
  }

  /// `Personalized News Feed`
  String get feature1_title {
    return Intl.message(
      'Personalized News Feed',
      name: 'feature1_title',
      desc: '',
      args: [],
    );
  }

  /// `Tailored news based on your interests`
  String get feature1_body {
    return Intl.message(
      'Tailored news based on your interests',
      name: 'feature1_body',
      desc: '',
      args: [],
    );
  }

  /// `Smart Categories`
  String get feature2_title {
    return Intl.message(
      'Smart Categories',
      name: 'feature2_title',
      desc: '',
      args: [],
    );
  }

  /// `Easy navigation through organized sections`
  String get feature2_body {
    return Intl.message(
      'Easy navigation through organized sections',
      name: 'feature2_body',
      desc: '',
      args: [],
    );
  }

  /// `Offline Reading`
  String get feature3_title {
    return Intl.message(
      'Offline Reading',
      name: 'feature3_title',
      desc: '',
      args: [],
    );
  }

  /// `Save articles to read later`
  String get feature3_body {
    return Intl.message(
      'Save articles to read later',
      name: 'feature3_body',
      desc: '',
      args: [],
    );
  }

  /// `Breaking News`
  String get feature4_title {
    return Intl.message(
      'Breaking News',
      name: 'feature4_title',
      desc: '',
      args: [],
    );
  }

  /// `Stay informed with important news`
  String get feature4_body {
    return Intl.message(
      'Stay informed with important news',
      name: 'feature4_body',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Current Version: 1.0.0`
  String get current_version {
    return Intl.message(
      'Current Version: 1.0.0',
      name: 'current_version',
      desc: '',
      args: [],
    );
  }

  /// `Last Updated: November 2024`
  String get last_update {
    return Intl.message(
      'Last Updated: November 2024',
      name: 'last_update',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Credits`
  String get credits {
    return Intl.message(
      'Credits',
      name: 'credits',
      desc: '',
      args: [],
    );
  }

  /// `Developed by: Karim Khater`
  String get developed_by {
    return Intl.message(
      'Developed by: Karim Khater',
      name: 'developed_by',
      desc: '',
      args: [],
    );
  }

  /// `News Sources`
  String get news_sources {
    return Intl.message(
      'News Sources',
      name: 'news_sources',
      desc: '',
      args: [],
    );
  }

  /// `1. Acceptance of Terms`
  String get terms_section1_title {
    return Intl.message(
      '1. Acceptance of Terms',
      name: 'terms_section1_title',
      desc: '',
      args: [],
    );
  }

  /// `By downloading, installing, or using Newsify, you agree to be bound by these Terms and Conditions. If you disagree with any part of these terms, you do not have permission to access the App.`
  String get terms_section1_body {
    return Intl.message(
      'By downloading, installing, or using Newsify, you agree to be bound by these Terms and Conditions. If you disagree with any part of these terms, you do not have permission to access the App.',
      name: 'terms_section1_body',
      desc: '',
      args: [],
    );
  }

  /// `2. Use License`
  String get terms_section2_title {
    return Intl.message(
      '2. Use License',
      name: 'terms_section2_title',
      desc: '',
      args: [],
    );
  }

  /// `Newsify grants you a limited, non-exclusive, non-transferable license to:`
  String get terms_section2_body {
    return Intl.message(
      'Newsify grants you a limited, non-exclusive, non-transferable license to:',
      name: 'terms_section2_body',
      desc: '',
      args: [],
    );
  }

  /// `Download and install the App on your personal devices`
  String get terms_point1 {
    return Intl.message(
      'Download and install the App on your personal devices',
      name: 'terms_point1',
      desc: '',
      args: [],
    );
  }

  /// `Access and view news content through the App`
  String get terms_point2 {
    return Intl.message(
      'Access and view news content through the App',
      name: 'terms_point2',
      desc: '',
      args: [],
    );
  }

  /// `Save articles for personal, non-commercial use`
  String get terms_point3 {
    return Intl.message(
      'Save articles for personal, non-commercial use',
      name: 'terms_point3',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
