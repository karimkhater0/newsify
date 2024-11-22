part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ChangedInterests extends HomeState {}

final class HomeChangeBottomNavBarState extends HomeState {
  final int currentIndex;
  HomeChangeBottomNavBarState(this.currentIndex);
}
final class HomeChangeCategoryState extends HomeState {
  final int currentCategoryIndex;
  HomeChangeCategoryState(this.currentCategoryIndex);
}

final class HomeGetNewsLoadingState extends HomeState {}
final class HomeGetNewsErrorState extends HomeState {
  final String error;

  HomeGetNewsErrorState(this.error);
}
final class HomeGetNewsSuccessState extends HomeState {}

final class HomeGetCategoryLoadingState extends HomeState {}
final class HomeGetCategoryErrorState extends HomeState {
  final String error;

  HomeGetCategoryErrorState(this.error);
}
final class HomeGetCategorySuccessState extends HomeState {}


final class SearchNewsLoadingState extends HomeState {}
final class SearchNewsErrorState extends HomeState {
  final String error;

  SearchNewsErrorState(this.error);
}
final class SearchNewsSuccessState extends HomeState {}

/// Database
final class CreateDatabaseSuccessState extends HomeState {}
final class CreateDatabaseErrorState extends HomeState {
  final String error;

  CreateDatabaseErrorState(this.error);
}
final class CreateDatabaseLoadingState extends HomeState {}


final class InsertToDatabaseSuccessState extends HomeState {}
final class InsertToDatabaseLoadingState extends HomeState {}
final class InsertToDatabaseErrorState extends HomeState {
  final String error;

  InsertToDatabaseErrorState(this.error);
}

final class GetFromDatabaseSuccessState extends HomeState {}
final class GetFromDatabaseLoadingState extends HomeState {}
final class GetFromDatabaseErrorState extends HomeState {
  final String error;

  GetFromDatabaseErrorState(this.error);
}

final class DeleteFromDatabaseSuccessState extends HomeState {}
final class DeleteFromDatabaseLoadingState extends HomeState {}
final class DeleteFromDatabaseErrorState extends HomeState {
  final String error;

  DeleteFromDatabaseErrorState(this.error);
}



