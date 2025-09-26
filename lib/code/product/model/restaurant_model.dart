class ProductItem {
  final String id;
  final String name;
  final String image;
  final String description;
  final String price;
  final String timeToCook;
  final String serveType;

  ProductItem({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.timeToCook,
    required this.serveType,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: json['price'],
      timeToCook: json['time_to_cook'],
      serveType: json['serve_type'],
    );
  }
}

class Category {
  final String categoryName;
  final List<ProductItem> data;

  Category({required this.categoryName, required this.data});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryName: json['category_name'],
      data: (json['data'] as List).map((e) => ProductItem.fromJson(e)).toList(),
    );
  }
}

class RestaurantModel {
  final int id;
  final String restaurantName;
  final String restaurantImage;
  final String vImage;
  final String hImage;
  final String address;
  final String city;
  final String rating;
  final String distance;
  final List<Category> variants;

  RestaurantModel({
    required this.id,
    required this.restaurantName,
    required this.restaurantImage,
    required this.vImage,
    required this.hImage,
    required this.address,
    required this.city,
    required this.rating,
    required this.distance,
    required this.variants,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      restaurantName: json['restaurant_name'],
      restaurantImage: json['restaurant_image'],
      vImage: json['v_image'],
      hImage: json['h_image'],
      address: json['address'],
      city: json['city'],
      rating: json['rating'],
      distance: json['distance'],
      variants: (json['variants'] as List)
          .map((e) => Category.fromJson(e))
          .toList(),
    );
  }
}
