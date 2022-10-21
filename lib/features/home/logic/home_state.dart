part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeDataLoadingState extends HomeState {}

class HomeDataLoadedSuccessfullyState extends HomeState {}

class HomeDataFailedToLoadState extends HomeState {
  final String failMsg;

  HomeDataFailedToLoadState({required this.failMsg});
}
