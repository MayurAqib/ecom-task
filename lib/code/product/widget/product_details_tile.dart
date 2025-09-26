import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercetask/code/cart/model/cart_model.dart';
import 'package:ecommercetask/code/cart/widget/cart_update_button.dart';
import 'package:ecommercetask/code/product/model/restaurant_model.dart';
import 'package:ecommercetask/common/dimesions.dart';
import 'package:ecommercetask/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductDetailsTile extends StatelessWidget {
  const ProductDetailsTile({
    super.key,
    required this.data,
    required this.isLast,
    required this.categoryName,
  });
  final ProductItem data;
  final String categoryName;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeightGap(gap: 0.015),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: '',
                    ),
                  ),
                  Text(
                    data.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: themeGrey,
                      fontFamily: '',
                    ),
                  ),
                ],
              ),
            ),
            const WidthGap(gap: 0.02),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: ColoredBox(
                color: Colors.grey.shade100,
                child: CachedNetworkImage(
                  imageUrl: data.image,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                    size: 26,
                  ),
                ),
              ),
            ),
          ],
        ),
        const HeightGap(gap: 0.005),
        Row(
          children: [
            Text(
              '₹${data.price}',
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
              data.timeToCook,
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
              data.serveType,
              style: const TextStyle(
                fontFamily: '',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            CartUpdateButton(
              cartProduct: CartModel(
                id: data.id,
                name: data.name,
                categoryName: categoryName,
                price: num.parse(data.price),
                time: data.timeToCook,
                serveType: data.serveType,
              ),
            ),
          ],
        ),
        const HeightGap(gap: 0.01),
        if (!isLast) Divider(color: Colors.grey.shade200),
      ],
    );
  }
}
