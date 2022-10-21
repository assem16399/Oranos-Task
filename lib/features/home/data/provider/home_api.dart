import 'package:dio/dio.dart';
import 'package:oranos/core/components/constants/endpoints.dart';

import '../../../../core/network/remote/dio_helper.dart';

abstract class HomeApi {
  Future<Map<String, dynamic>> getCategories();
  Future<Map<String, dynamic>> getRecommendedExperts();
  Future<Map<String, dynamic>> getOnlineExperts();
}

class HomeApiWithDioImpl extends HomeApi {
  @override
  Future<Map<String, dynamic>> getCategories() async {
    // TODO: implement getPosts
    final response = await DioHelper.getRequest(path: kCategoriesEndpoint);

    if (_canBeParsed(response)) {
      return response.data;
    } else {
      return {};
    }
  }

  @override
  Future<Map<String, dynamic>> getOnlineExperts() async {
    final response = await DioHelper.getRequest(path: kOnlineExpertsEndpoint);

    if (_canBeParsed(response)) {
      return response.data;
    } else {
      return {};
    }
  }

  @override
  Future<Map<String, dynamic>> getRecommendedExperts() async {
    // TODO: implement getPosts
    final response =
        await DioHelper.getRequest(path: kRecommendedExpertsEndpoint);

    if (_canBeParsed(response)) {
      return response.data;
    } else {
      return {};
    }
  }

  bool _canBeParsed(Response response) {
    if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
      return true;
    }
    return false;
  }
}
