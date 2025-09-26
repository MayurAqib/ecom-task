import 'package:ecommercetask/code/cart/model/cart_model.dart';
import 'package:ecommercetask/code/cart/widget/cart_update_button.dart';
import 'package:ecommercetask/common/dimesions.dart';
import 'package:ecommercetask/constants/colors.dart';
import 'package:flutter/material.dart';

class CartProductTile extends StatelessWidget {
  const CartProductTile({super.key, required this.cart});
  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeightGap(gap: 0.015),
        Text(
          cart.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: '',
          ),
        ),
        Text(
          cart.categoryName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: themeGrey,
            fontFamily: '',
          ),
        ),
        const HeightGap(gap: 0.005),
        Row(
          children: [
            Text(
              '₹${cart.price}',
              style: const TextStyle(
                fontFamily: '',
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const WidthGap(gap: 0.01),
            Icon(Icons.circle, color: Colors.grey.shade600, size: 5),
            const WidthGap(gap: 0.01),
            Text(
              cart.time,
              style: const TextStyle(
                fontFamily: '',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const WidthGap(gap: 0.01),
            Icon(Icons.circle, color: Colors.grey.shade600, size: 5),
            const WidthGap(gap: 0.01),
            Text(
              cart.serveType,
              style: const TextStyle(
                fontFamily: '',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            CartUpdateButton(cartProduct: cart),
          ],
        ),
        const HeightGap(gap: 0.007),
        Divider(color: Colors.grey.shade200),
      ],
    );
  }
}
