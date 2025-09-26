import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String categoryName;

  @HiveField(3)
  final num price;

  @HiveField(4)
  final String time;

  @HiveField(5)
  final String serveType;

  @HiveField(6)
  int quantity;

  CartModel({
    required this.id,
    required this.name,
    required this.categoryName,
    required this.price,
    required this.time,
    required this.serveType,
    this.quantity = 0,
  });
}
