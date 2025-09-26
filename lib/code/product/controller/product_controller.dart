import 'dart:convert';

import 'package:ecommercetask/code/product/model/restaurant_model.dart';
import 'package:ecommercetask/common/toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductState {
  final DateTime lastBackPressed;
  final bool exitPop;
  final List<RestaurantModel> restaurants;
  final bool isLoading;

  ProductState({
    required this.lastBackPressed,
    required this.exitPop,
    required this.restaurants,
    required this.isLoading,
  });

  ProductState copyWith({
    DateTime? lastBackPressed,
    bool? exitPop,
    List<RestaurantModel>? restaurants,
    bool? isLoading,
  }) {
    return ProductState(
      lastBackPressed: lastBackPressed ?? this.lastBackPressed,
      exitPop: exitPop ?? this.exitPop,
      restaurants: restaurants ?? this.restaurants,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class ProductController extends Notifier<ProductState> {
  @override
  ProductState build() {
    Future.microtask(() => loadRestaurants());
    return ProductState(
      lastBackPressed: DateTime.now(),
      exitPop: false,
      restaurants: [],
      isLoading: true,
    );
  }

  Future<void> loadRestaurants() async {
    state = state.copyWith(isLoading: true);
    try {
      final jsonString = await rootBundle.loadString(
        'assets/json/restaurants.json',
      );
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final products = jsonData['products'] as List;
      final restaurants = products
          .map((e) => RestaurantModel.fromJson(e))
          .toList();

      state = state.copyWith(restaurants: restaurants);
    } catch (e) {
      showSnackBar('Error loading data: $e');
    }
    state = state.copyWith(isLoading: false);
  }

  void canPopScreen(BuildContext context) {
    if (DateTime.now().difference(state.lastBackPressed) >
        const Duration(milliseconds: 1200)) {
      state = state.copyWith(lastBackPressed: DateTime.now(), exitPop: false);
      showSnackBar('Press back again to exit');
    } else {
      state = state.copyWith(exitPop: true);
      if (state.exitPop) {
        SystemNavigator.pop();
      }
    }
  }

  void filterProductList(String query) {
    if (query.isEmpty) {
      loadRestaurants();
      return;
    }

    final lowerQuery = query.toLowerCase();

    final filteredRestaurants = state.restaurants
        .map((restaurant) {
          final filteredVariants = restaurant.variants
              .map((category) {
                final filteredProducts = category.data.where((product) {
                  return product.name.toLowerCase().contains(lowerQuery) ||
                      product.description.toLowerCase().contains(lowerQuery) ||
                      category.categoryName.toLowerCase().contains(
                        lowerQuery,
                      ) ||
                      restaurant.restaurantName.toLowerCase().contains(
                        lowerQuery,
                      );
                }).toList();

                return Category(
                  categoryName: category.categoryName,
                  data: filteredProducts,
                );
              })
              .where((cat) => cat.data.isNotEmpty)
              .toList();

          return RestaurantModel(
            id: restaurant.id,
            restaurantName: restaurant.restaurantName,
            restaurantImage: restaurant.restaurantImage,
            vImage: restaurant.vImage,
            hImage: restaurant.hImage,
            address: restaurant.address,
            city: restaurant.city,
            rating: restaurant.rating,
            distance: restaurant.distance,
            variants: filteredVariants,
          );
        })
        .where((rest) => rest.variants.isNotEmpty)
        .toList();

    state = state.copyWith(restaurants: filteredRestaurants);
  }
}

final productController = NotifierProvider<ProductController, ProductState>(
  ProductController.new,
);
