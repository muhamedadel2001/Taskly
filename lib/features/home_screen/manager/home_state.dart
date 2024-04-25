part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeChangeLightTheme extends HomeState {}
class HomeChangeDarkTheme extends HomeState {}
class SelectedDateSuccess extends HomeState {}
class GetTasksSuccess extends HomeState {}

