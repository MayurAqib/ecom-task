import 'package:ecommercetask/code/cart/controller/cart_controller.dart';
import 'package:ecommercetask/code/cart/model/cart_model.dart';
import 'package:ecommercetask/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartUpdateButton extends ConsumerWidget {
  const CartUpdateButton({super.key, required this.cartProduct});
  final CartModel cartProduct;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(cartController.notifier);
    final quantity = notifier.fetchProductQuantity(cartProduct.id);
    return quantity == 0
        ? GestureDetector(
            onTap: () {
              notifier.addToCart(cartProduct);
            },
            child: Container(
              width: 100,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  colors: [darkThemeColor, mediumThemeColor],
                ),
              ),
              child: const Text(
                'Add',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: '',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          )
        : ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [darkThemeColor, mediumThemeColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
            child: Container(
              width: 100,
              alignment: Alignment.center,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: mediumThemeColor),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        notifier.updateCartProductQuantity(
                          cartProduct.id,
                          hasIncreased: false,
                        );
                      },
                      child: Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: const Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                  ),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: '',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        notifier.updateCartProductQuantity(cartProduct.id);
                      },
                      child: Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
