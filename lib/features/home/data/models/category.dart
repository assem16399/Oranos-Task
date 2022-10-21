class Category {
  final int id;
  final String title;
  final String imageUrl;
  final int expertsCount;

  Category({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.expertsCount,
  });

  factory Category.fromJson({required Map<String, dynamic> json}) {
    return Category(
        id: json['id'],
        title: json['title'],
        imageUrl: json['image_url'],
        expertsCount: json['experts_count']);
  }
}
