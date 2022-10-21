import 'package:bloc/bloc.dart';

import '/features/home/data/models/recommended_expert.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  final favorites = <int, RecommendedExpert>{};

  void toggleExpertFavoriteStatus(RecommendedExpert expert) {
    if (!isInFavorites(expert.id)) {
      favorites[expert.id] = expert;
    } else {
      favorites.remove(expert.id);
    }
    emit(FavoritesStatusChangedState(itemId: expert.id));
  }

  bool isInFavorites(int id) {
    return favorites.containsKey(id);
  }
}
