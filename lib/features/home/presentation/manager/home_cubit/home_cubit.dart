import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/core/dio_helper.dart';
import 'package:newsify/features/home/data/interests.dart';
import 'package:newsify/features/home/presentation/views/widgets/archive_view_body.dart';
import 'package:newsify/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:newsify/features/home/presentation/views/widgets/search_view_body.dart';
import 'package:newsify/features/home/presentation/views/widgets/settings_view_body.dart';

import '../../../../../core/cache_helper.dart';
import '../../../../../core/database_helper.dart';
import '../../../data/news_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  final String apiKey = 'pub_57975675b5780b61110fa353d1cfc99c3fe97';
  final isDark = CacheHelper.getData(key: 'isDark');
  final String countryCode = 'eg';



  /// Interests
  final List<InterestsModel> interestsList = [
    InterestsModel(interest: 'business', isSelected: false),
    InterestsModel(interest: 'entertainment', isSelected: false),
    InterestsModel(interest: 'health', isSelected: false),
    InterestsModel(interest: 'tourism', isSelected: false),
    InterestsModel(interest: 'science', isSelected: false),
    InterestsModel(interest: 'sports', isSelected: false),
    InterestsModel(interest: 'technology', isSelected: false),
    InterestsModel(interest: 'politics', isSelected: false),
  ];

  bool isInterestSelected(String interest) {
    for(var element in interestsList){
      if(element.interest == interest){
        return element.isSelected;
      }
    }
    return false;
  }

  void toggleInterest(String interest) {
    for(var element in interestsList){
      if(element.interest == interest){
        element.isSelected = !element.isSelected;
      }
    }
    emit(ChangedInterests());
  }

  Future<void> setSelectedInterests()async {
    List<String> interests = [];
    for(var element in interestsList)
      {
        if(element.isSelected == true)
          {
            interests.add(element.interest);
          }

      }
    CacheHelper.saveList(key: 'interests', list: interests).then((value){
    }).catchError((error){
      debugPrint(error.toString());
    });
  }

  String getSelectedInterests()
  {
    List<String> selectedInterests = CacheHelper.getList(key: 'interests');
    for(var element in selectedInterests)
    {
      for(var interest in interestsList)
      {
        if(interest.interest == element)
        {
          interest.isSelected = true;
        }
      }
    }
    String interests = selectedInterests.toString();
    interests = interests.substring(1, interests.length - 1);
    return interests;
  }



  ///NAVIGATION: bottom nav bar, Categories
  int currentIndex = 0;
  List<Widget> screens = const [
    HomeViewBody(),
    SearchViewBody(),
    ArchiveViewBody(),
    SettingsViewBody(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavBarState(index));
  }

  int currentCategoryIndex = 0;
  List<String> categories = [
    'business',
    'entertainment',
    'health',
    'tourism',
    'science',
    'sports',
    'technology',
    'politics',
    'top',
    'world',
  ];
  void changeCategory(int index) {
    currentCategoryIndex = index;
    emit(HomeChangeCategoryState(index));
    getCategorizedNews(categories[index]);
  }

  ///Get News
  List<Results> homeNews = [];
  Future<void> getNews() async {
    emit(HomeGetNewsLoadingState());

    String categoriesText = getSelectedInterests();

    DioHelper.getData(
      url: 'latest',
      query: categoriesText != ''
          ? {
              'apiKey': apiKey,
              'country': countryCode,
              //'language': 'en,ar',
              'language': 'en',
              'category': categoriesText
            }
          : {
              'apiKey': apiKey,
              'country': countryCode,
              //'language': 'en,ar',
              'language': 'en',
            },
    ).then((value) async{
      homeNews = NewsModel.fromJson(value?.data).results!;
      if(homeNews.isEmpty)
        {
          homeNews = await defaultData();
        }
      emit(HomeGetNewsSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(HomeGetNewsErrorState(error.toString()));
    });
  }

  ///if news is empty, get default data
  Future<List<Results>> defaultData()async
  {
    List<Results> list = [];
    emit(HomeGetNewsLoadingState());

    await DioHelper.getData(
      url: 'latest',
      query: {
        'apiKey': apiKey,
        'country': countryCode,
        //'language': 'en,ar',
        'language': 'en',
      },
    ).then((value) {
      list = NewsModel.fromJson(value?.data).results!;
    }).catchError((error) {
      debugPrint(error.toString());
      emit(HomeGetNewsErrorState(error.toString()));
    });
    return list;

  }

  List<Results> categoryNews = [];

  Future<void> getCategorizedNews(String category) async
  {
    emit(HomeGetCategoryLoadingState());

    DioHelper.getData(
      url: 'latest',
      query: {
        'apiKey' : apiKey,
        'country': countryCode,
        //'language': 'en,ar',
        'language': 'en',
        'category' : category,
      },
    )
        .then((value){
      categoryNews = NewsModel.fromJson(value?.data).results!;
      emit(HomeGetCategorySuccessState());
    })
        .catchError((error){
      emit(HomeGetCategoryErrorState(error.toString()));
    });

  }

  ///Refresh
  Future<void> onRefresh() async {
    getNews().then((value){
      changeCategory(currentCategoryIndex);
    });
  }
  ///Search
  final TextEditingController searchController = TextEditingController();
  List<Results> searchNews = [];
  Future<void> getSearchNews(String search) async {
    emit(SearchNewsLoadingState());
    DioHelper.getData(
      url: 'latest',
      query: {
        'apiKey': apiKey,
        'q': search,
        //'language': 'en,ar',
        'language': 'en',
      },
    ).then((value) {
      searchNews = NewsModel.fromJson(value?.data).results!;
      emit(SearchNewsSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(SearchNewsErrorState(error.toString()));
    });
  }


  ///DATABASE: Archived News

  // List<Results> archivedNews = [];
  // late Database database;

  // void createDatabase() async {
  //   await openDatabase(
  //     'news.db',
  //     version: 1,
  //     onCreate: (database, version) async {
  //       debugPrint('created database');
  //       await database.execute(
  //         '''
  //         CREATE TABLE articles(
  //         id INTEGER PRIMARY KEY, articleId TEXT, title TEXT, link TEXT,
  //         description TEXT, content TEXT, pubDate TEXT, pubDateTz TEXT,
  //         imageUrl TEXT, sourceId TEXT, sourceName TEXT, sourceUrl TEXT,
  //         sourceIcon TEXT, language TEXT, country TEXT, category TEXT)''',
  //       );
  //       debugPrint('created TABLE');
  //     },
  //     onOpen: (database) {
  //       getFromDatabase(database);
  //
  //       debugPrint('opened database');
  //     },
  //   ).then((value) {
  //     database = value;
  //     debugPrint('>>>>>>>>>>Initialized Database');
  //     emit(CreateDatabaseSuccessState());
  //   }).catchError((error) {
  //     debugPrint(error.toString());
  //     emit(CreateDatabaseErrorState(error));
  //   });
  // }
  //
  // Future<void> insertToDatabase(Results model) async {
  //   emit(InsertToDatabaseLoadingState());
  //
  //   await database.transaction((action) async {
  //     await action.rawInsert(
  //       '''INSERT INTO articles (
  //   articleId,
  //   title,
  //   link,
  //   description,
  //   content,
  //   pubDate,
  //   pubDateTZ,
  //   imageUrl,
  //   sourceId,
  //   sourceName,
  //   sourceUrl,
  //   sourceIcon,
  //   language,
  //   country,
  //   category) VALUES ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,? )''',
  //       [
  //         model.articleId,
  //         model.title,
  //         model.link,
  //         model.description,
  //         model.content,
  //         model.pubDate,
  //         model.pubDateTZ,
  //         model.imageUrl,
  //         model.sourceId,
  //         model.sourceName,
  //         model.sourceUrl,
  //         model.sourceIcon,
  //         model.language,
  //         model.country?.first ?? '',
  //         model.category?.first ?? 'other',
  //       ],
  //     );
  //   }).then((value) {
  //     emit(InsertToDatabaseSuccessState());
  //   }).catchError((error){
  //     debugPrint(error.toString());
  //     emit(InsertToDatabaseErrorState(error.toString()));
  //   });
  // }
  //
  // Future<void> getFromDatabase(database)async {
  //   archivedNews = [];
  //   emit(GetFromDatabaseLoadingState());
  //   database.rawQuery('SELECT * FROM articles')
  //       .then((value) {
  //     value.forEach((element)
  //     {
  //       archivedNews.add(Results.fromMap(element));
  //     });
  //     emit(GetFromDatabaseSuccessState());
  //   })
  //       .catchError((error) {
  //     debugPrint(error.toString());
  //     emit(GetFromDatabaseErrorState(error.toString()));
  //   });
  // }
  //
  // void deleteFromDatabase(String articleId) {
  //   database.rawDelete(
  //     'DELETE FROM articles WHERE articleId = ?',[articleId],
  //   ).then((value) {
  //     getFromDatabase(database);
  //     emit(DeleteFromDatabaseSuccessState());
  //   });
  // }

  bool isArchived(Results model) {
    for (int i = 0; i < archivedNews.length; i++) {
      if (archivedNews[i].articleId == model.articleId) {
        return true;
      }
    }
    return false;
  }

  Future<void> archiveArticle(Results model)async{
    if(isArchived(model))
      {
        await deleteArticle(model.articleId!);
      }
    else
      {
        await insertArticle(model);
      }
    await loadArticles();

  }


  final _dbHelper = DatabaseHelper.instance;
  List<Results> archivedNews = [];
  Future<void> initializeDatabase() async {
    try {
      emit(CreateDatabaseLoadingState());
      await _dbHelper.database; // This ensures database is initialized
      emit(CreateDatabaseSuccessState());
    } catch (e) {
      emit(CreateDatabaseErrorState(e.toString()));
    }
  }

  Future<void> insertArticle(Results model) async {
    try {
      emit(InsertToDatabaseLoadingState());
      await _dbHelper.insertArticle(model).then((value) {

        emit(InsertToDatabaseSuccessState());

      });
    } catch (e) {
      emit(InsertToDatabaseErrorState(e.toString()));
    }
  }

  Future<void> loadArticles() async {
    try {
      emit(GetFromDatabaseLoadingState());
      await _dbHelper.getArticles().then((value) {
        archivedNews = value;
        emit(GetFromDatabaseSuccessState());
      });
    } catch (e) {
      emit(GetFromDatabaseErrorState(e.toString()));
    }
  }

  Future<void> deleteArticle(String articleId)async{
    emit(DeleteFromDatabaseLoadingState());
    try{
      await _dbHelper.deleteArticle(articleId).then((value){
        emit(DeleteFromDatabaseSuccessState());
      });
    }catch(error){
      debugPrint(error.toString());
      emit(DeleteFromDatabaseErrorState(error.toString()));
    }
  }
}
