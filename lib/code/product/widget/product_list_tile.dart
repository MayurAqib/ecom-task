import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercetask/code/product/model/restaurant_model.dart';
import 'package:ecommercetask/code/product/screens/product_details_screen.dart';
import 'package:ecommercetask/common/dimesions.dart';
import 'package:ecommercetask/common/navigation.dart';
import 'package:ecommercetask/constants/app_assets.dart';
import 'package:ecommercetask/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.data});
  final RestaurantModel data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.changeScreen(ProductDetailsScreen(data: data));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color.fromARGB(99, 238, 238, 238),
            width: 3,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: ColoredBox(
                    color: Colors.grey.shade200,
                    child: CachedNetworkImage(
                      imageUrl: data.vImage,
                      height: 110,
                      width: 88,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                const WidthGap(gap: 0.02),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              data.restaurantName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'bold',
                              ),
                            ),
                          ),
                          const Icon(Icons.favorite, color: themeColor),
                        ],
                      ),
                      const HeightGap(gap: 0.006),
                      Row(
                        children: [
                          Image.asset(AppAssets.homepin, height: 17),
                          const WidthGap(gap: 0.01),
                          Text(
                            data.address,
                            style: const TextStyle(
                              fontFamily: 'medium',
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const HeightGap(gap: 0.006),
                      Text(
                        data.city,
                        style: const TextStyle(
                          fontFamily: '',
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const HeightGap(gap: 0.006),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: mediumThemeColor,
                            size: 16,
                          ),
                          const WidthGap(gap: 0.01),
                          Text(
                            data.rating,
                            style: const TextStyle(
                              fontFamily: 'semibold',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          const WidthGap(gap: 0.06),
                          Image.asset(AppAssets.locationPin, height: 17),
                          const WidthGap(gap: 0.01),
                          Text(
                            data.distance,
                            style: const TextStyle(
                              fontFamily: 'semibold',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const HeightGap(gap: 0.01),
                    ],
                  ),
                ),
              ],
            ),
            const HeightGap(gap: 0.01),
            Row(
              children: [
                Image.asset(AppAssets.offer, height: 17),
                const WidthGap(gap: 0.02),
                const Text(
                  'Flat 10% Off above value of ₹200',
                  style: TextStyle(
                    fontFamily: 'bold',
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
