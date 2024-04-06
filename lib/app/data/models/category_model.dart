class CategoryModel {
  final int? id;
  final int? position;
  final int? restaurantId;
  final String? title;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  CategoryModel({
    this.id,
    this.image,
    this.position,
    this.restaurantId,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<dynamic, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      position: json['position'] ?? 0,
      restaurantId: json['restaurantId'] ?? 0,
      title: json['title'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
