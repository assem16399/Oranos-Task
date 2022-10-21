import 'online_expert.dart';

class RecommendedExpert extends OnlineExpert {
  final double rating;
  final String specialization;

  RecommendedExpert(
      {required int id,
      required String name,
      required String imageUrl,
      required this.rating,
      required this.specialization})
      : super(id: id, imageUrl: imageUrl, name: name);

  factory RecommendedExpert.fromJson({required Map<String, dynamic> json}) {
    return RecommendedExpert(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
      rating:
          json['rating'] is int ? json['rating'].toDouble() : json['rating'],
      specialization: json['specialization'],
    );
  }
}
