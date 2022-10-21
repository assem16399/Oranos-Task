import 'package:bloc/bloc.dart';

import '/features/home/data/models/home_data_model.dart';
import '/features/home/data/models/recommended_expert.dart';
import '/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  final HomeRepo homeRepo;

  var homeModel = HomeDataModel.empty();

  RecommendedExpert findExpertById(int id) {
    return homeModel.recommendedExperts.firstWhere((expert) => expert.id == id);
  }

  void getHomeData() async {
    emit(HomeDataLoadingState());
    final either = await homeRepo.getHomeData();
    either.fold(
        (failure) =>
            emit(HomeDataFailedToLoadState(failMsg: failure.failureMsg)),
        (homeModel) {
      this.homeModel = homeModel;
      emit(HomeDataLoadedSuccessfullyState());
    });
  }
}
