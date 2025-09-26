import 'package:ecommercetask/code/cart/model/cart_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartState {
  final bool isLoading;
  final List<CartModel> cartList;
  final Box cartBox;
  CartState({
    required this.isLoading,
    required this.cartList,
    required this.cartBox,
  });

  CartState copyWith({
    bool? isLoading,
    List<CartModel>? cartList,
    Box? cartBox,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      cartList: cartList ?? this.cartList,
      cartBox: cartBox ?? this.cartBox,
    );
  }
}

class CartController extends Notifier<CartState> {
  @override
  CartState build() {
    final box = Hive.box<CartModel>('cartBox');

    final savedCart = box.values.toList();

    return CartState(isLoading: false, cartList: savedCart, cartBox: box);
  }

  //todo: Add to cart
  Future<void> addToCart(CartModel cartProduct) async {
    final box = state.cartBox as Box<CartModel>;

    if (!box.containsKey(cartProduct.id)) {
      cartProduct.quantity = 1;
      await box.put(cartProduct.id, cartProduct);
    } else {
      final existingProduct = box.get(cartProduct.id)!;
      existingProduct.quantity += 1;
      await box.put(cartProduct.id, existingProduct);
    }

    state = state.copyWith(cartList: box.values.toList());
  }

  //todo: Update quantity of product in cart
  Future<void> updateCartProductQuantity(
    String id, {
    bool hasIncreased = true,
  }) async {
    final box = state.cartBox as Box<CartModel>;
    if (!box.containsKey(id)) return;

    final product = box.get(id)!;

    if (hasIncreased) {
      product.quantity += 1;
    } else {
      if (product.quantity > 1) {
        product.quantity -= 1;
      } else {
        await box.delete(id);
        state = state.copyWith(cartList: box.values.toList());
        return;
      }
    }

    await box.put(id, product);
    state = state.copyWith(cartList: box.values.toList());
  }

  //todo: Fetch product quantity from cart
  int fetchProductQuantity(String id) {
    final product = state.cartBox.get(id);
    return product?.quantity ?? 0;
  }

  //todo: Fetch total price of all items in the cart
  num getTotalCartPrice() {
    return (state.cartBox as Box<CartModel>).values.fold(
      0,
      (total, item) => total + (item.price * item.quantity),
    );
  }

  //todo: Remove product completely
  Future<void> removeFromCart(String id) async {
    final box = state.cartBox as Box<CartModel>;
    await box.delete(id);
    state = state.copyWith(cartList: box.values.toList());
  }

  //todo: Clear Cart
  Future<void> clearCart() async {
    final box = state.cartBox as Box<CartModel>;
    await box.clear();
    state = state.copyWith(cartList: []);
  }
}

final cartController = NotifierProvider<CartController, CartState>(
  CartController.new,
);
