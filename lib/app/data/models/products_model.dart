class ProductsModel {
  final String? image;
  final int? id;
  final String? price;
  final bool? active;
  final bool? popular;
  final String? discount;
  final int? position;
  final String? createdAt;
  final String? updatedAt;
  final int? prodCategoryId;
  final int? restaurantId;
  final String? restaurant;
  final String? currentPrice;
  int quantity;

  ProductsModel({
    this.id,
    this.image,
    this.position,
    this.restaurantId,
    this.price,
    this.active,
    this.popular,
    this.discount,
    this.prodCategoryId,
    this.restaurant,
    this.currentPrice,
    this.createdAt,
    this.updatedAt,
    this.quantity = 1,
  });

  factory ProductsModel.fromJson(Map<dynamic, dynamic> json) {
    return ProductsModel(
      image: json['image'] ?? '',
      id: json['id'] ?? 0,
      price: json['price'] ?? '',
      active: json['active'] ?? false,
      popular: json['popular'] ?? false,
      discount: json['discount'] ?? '',
      position: json['position'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      prodCategoryId: json['prodCategoryId'] ?? 0,
      restaurantId: json['restaurantId'] ?? 0,
      restaurant: json['restaurant'] ?? '',
      currentPrice: json['currentPrice'] ?? '',
      quantity: json['quantity'] ?? 1,
    );
  }
}
