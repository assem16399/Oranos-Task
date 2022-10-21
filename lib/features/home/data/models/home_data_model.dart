import '/features/home/data/models/recommended_expert.dart';
import 'category.dart';
import 'online_expert.dart';

class HomeDataModel {
  List<OnlineExpert> onlineExperts = [];
  List<RecommendedExpert> recommendedExperts = [];
  List<Category> categories = [];

  HomeDataModel.empty();
  HomeDataModel(
      {required this.onlineExperts,
      required this.recommendedExperts,
      required this.categories});
}
