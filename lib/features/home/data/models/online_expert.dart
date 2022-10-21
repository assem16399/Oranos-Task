class OnlineExpert {
  final int id;
  final String name;
  final String imageUrl;

  OnlineExpert({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory OnlineExpert.fromJson({required Map<String, dynamic> json}) {
    return OnlineExpert(
        id: json['id'], name: json['name'], imageUrl: json['image_url']);
  }
}
