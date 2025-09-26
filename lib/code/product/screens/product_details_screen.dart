import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercetask/code/cart/controller/cart_controller.dart';
import 'package:ecommercetask/code/cart/screen/cart_screen.dart';
import 'package:ecommercetask/code/product/model/restaurant_model.dart';
import 'package:ecommercetask/code/product/widget/product_details_tile.dart';
import 'package:ecommercetask/common/buttons.dart';
import 'package:ecommercetask/common/dimesions.dart';
import 'package:ecommercetask/common/navigation.dart';
import 'package:ecommercetask/constants/app_assets.dart';
import 'package:ecommercetask/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailsScreen extends ConsumerWidget {
  const ProductDetailsScreen({super.key, required this.data});
  final RestaurantModel data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartController);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(height: screenHeight(context)),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            child: ColoredBox(
              color: Colors.grey.shade200,
              child: CachedNetworkImage(
                imageUrl: data.hImage,
                width: screenWidth(context),
                fit: BoxFit.cover,
                height: screenHeight(context) * 0.25,
                errorWidget: (context, url, error) => const Icon(
                  Icons.image_not_supported,
                  color: Colors.grey,
                  size: 60,
                ),
              ),
            ),
          ),
          AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomBackButton(),
            ),
          ),
          Positioned(
            top: screenHeight(context) * 0.2,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: screenWidth(context) * 0.03,
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade200, width: 0.7),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: ColoredBox(
                              color: Colors.grey.shade100,
                              child: CachedNetworkImage(
                                imageUrl: data.restaurantImage,
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                      Icons.image_not_supported,
                                      color: Colors.grey,
                                      size: 26,
                                    ),
                              ),
                            ),
                          ),
                          const WidthGap(gap: 0.02),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.restaurantName,
                                  style: const TextStyle(
                                    fontFamily: '',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 24,
                                  ),
                                ),
                                const HeightGap(gap: 0.006),
                                Row(
                                  children: [
                                    Image.asset(AppAssets.mapPin, height: 17),
                                    const WidthGap(gap: 0.01),
                                    Text(
                                      data.city,
                                      style: const TextStyle(
                                        fontFamily: '',
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const WidthGap(gap: 0.06),
                                    Image.asset(AppAssets.location, height: 17),
                                    const WidthGap(gap: 0.01),
                                    Text(
                                      data.distance,
                                      style: const TextStyle(
                                        fontFamily: 'semibold',
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const WidthGap(gap: 0.06),
                                    Image.asset(AppAssets.star, height: 17),
                                    const WidthGap(gap: 0.015),
                                    Text(
                                      data.rating,
                                      style: const TextStyle(
                                        fontFamily: 'semibold',
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey.shade200),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade200,
                            width: 0.7,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Image.asset(AppAssets.offer, height: 27),
                            const WidthGap(gap: 0.02),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'Use code ',
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'DSALOON',
                                        style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Get ₹20 off on order above ₹100',
                                        style: TextStyle(
                                          fontFamily: '',
                                          fontSize: 14,
                                          color: themeGrey,
                                        ),
                                      ),
                                      Image.asset(
                                        AppAssets.moreHoritz,
                                        height: 6,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const HeightGap(gap: 0.012),
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    itemCount: 4,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) * 0.01,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      List filter = ['All', 'Veg', 'Vegan', 'Non-Veg'];
                      return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        margin: EdgeInsets.symmetric(
                          horizontal: screenWidth(context) * 0.02,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: index == 0 ? themeColor : themeColor,
                          ),
                          gradient: index == 0
                              ? const LinearGradient(
                                  colors: [
                                    darkThemeColor,
                                    themeColor,
                                    mediumThemeColor,
                                  ],
                                )
                              : const LinearGradient(
                                  colors: [Colors.white, Colors.white],
                                ),
                        ),
                        child: index == 0
                            ? Text(
                                filter[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'semibold',
                                ),
                              )
                            : ShaderMask(
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                      colors: [
                                        darkThemeColor,
                                        mediumThemeColor,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(
                                      Rect.fromLTWH(
                                        0,
                                        0,
                                        bounds.width,
                                        bounds.height,
                                      ),
                                    ),
                                child: Text(
                                  filter[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'semibold',
                                  ),
                                ),
                              ),
                      );
                    },
                  ),
                ),
                const HeightGap(gap: 0.012),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.variants.length,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) * 0.03,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final variantData = data.variants[index];
                      return Theme(
                        data: Theme.of(context).copyWith(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 7),
                          child: ExpansionTile(
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.grey.shade200),
                            ),
                            enableFeedback: false,
                            initiallyExpanded: index == 0,
                            collapsedBackgroundColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            // showTrailingIcon: false,
                            tilePadding: EdgeInsets.symmetric(
                              horizontal: screenWidth(context) * 0.03,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.grey.shade200),
                            ),
                            title: Text(
                              variantData.categoryName,
                              style: const TextStyle(
                                fontSize: 17,
                                fontFamily: '',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            children: [
                              ListView.builder(
                                itemCount: variantData.data.length,
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth(context) * 0.03,
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  final variantsList = variantData.data[index];
                                  final isLast =
                                      index + 1 == variantData.data.length;
                                  return ProductDetailsTile(
                                    data: variantsList,
                                    categoryName: variantData.categoryName,
                                    isLast: isLast,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: state.cartList.isEmpty
          ? const SizedBox()
          : BottomBarButton(
              child: IntrinsicHeight(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context) * 0.03,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 1,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text('${state.cartList.length} item added'),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          NavigationService.changeScreen(const CartScreen());
                        },
                        child: Container(
                          width: 100,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                              colors: [darkThemeColor, mediumThemeColor],
                            ),
                          ),
                          child: const Text(
                            'Check out',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: '',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
