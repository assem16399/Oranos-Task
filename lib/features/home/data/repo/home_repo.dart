import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:oranos/core/errors/failures.dart';
import 'package:oranos/features/home/data/models/category.dart';
import 'package:oranos/features/home/data/models/home_data_model.dart';
import 'package:oranos/features/home/data/models/online_expert.dart';
import 'package:oranos/features/home/data/models/recommended_expert.dart';
import 'package:oranos/features/home/data/provider/home_api.dart';

import '../../../../core/network/network_info.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeDataModel>> getHomeData();
}

class HomeRepoImpl implements HomeRepo {
  final HomeApi homeApi;
  final NetworkInfo networkInfo;

  HomeRepoImpl({required this.homeApi, required this.networkInfo});

  @override
  Future<Either<Failure, HomeDataModel>> getHomeData() async {
    if (await networkInfo.isConnected) {
      return await _handleGettingHomeData();
    } else {
      return Left(NoInternetFailure());
    }
  }

  Future<Either<Failure, HomeDataModel>> _handleGettingHomeData() async {
    try {
      final homeRawData = await Future.wait([
        homeApi.getCategories(),
        homeApi.getOnlineExperts(),
        homeApi.getRecommendedExperts(),
      ]);
      return Right(_getPopulatedHomeData(homeRawData));
    } on DioError catch (error) {
      if (error.type == DioErrorType.connectTimeout) {
        return Left(TimeoutFailure());
      }
      return Left(ServerFailure());
    } catch (_) {
      return Left(UndefinedFailure());
    }
  }

  HomeDataModel _getPopulatedHomeData(List<Map<String, dynamic>> homeRawData) {
    var homeData = HomeDataModel.empty();

    homeRawData[0].forEach((fbId, rawData) {
      homeData.categories.add(Category.fromJson(json: rawData));
    });
    homeRawData[1].forEach((fbId, rawData) {
      homeData.onlineExperts.add(OnlineExpert.fromJson(json: rawData));
    });
    homeRawData[2].forEach((fbId, rawData) {
      homeData.recommendedExperts
          .add(RecommendedExpert.fromJson(json: rawData));
    });
    return homeData;
  }
}
