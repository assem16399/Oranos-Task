part of 'favorites_cubit.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesStatusChangedState extends FavoritesState {
  final int itemId;

  FavoritesStatusChangedState({required this.itemId});
}
