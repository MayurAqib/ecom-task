import 'package:ecommercetask/code/product/controller/product_controller.dart';
import 'package:ecommercetask/code/product/widget/product_list_tile.dart';
import 'package:ecommercetask/common/buttons.dart';
import 'package:ecommercetask/common/dimesions.dart';
import 'package:ecommercetask/common/textformfield.dart';
import 'package:ecommercetask/constants/app_assets.dart';
import 'package:ecommercetask/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productController);
    final productNotifier = ref.watch(productController.notifier);
    return PopScope(
      canPop: productState.exitPop,
      onPopInvokedWithResult: (didPop, result) {
        productNotifier.canPopScreen(context);
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          height: screenHeight(context),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white54,
                Colors.white54,
                Colors.white,
                Colors.white,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const HeightGap(gap: 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context) * 0.03,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: screenWidth(context) * 0.03,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Image.asset(AppAssets.pin, height: 17),
                            const WidthGap(gap: 0.01),
                            ShaderMask(
                              shaderCallback: (bounds) =>
                                  const LinearGradient(
                                    colors: [darkThemeColor, mediumThemeColor],
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
                              child: const Text(
                                'Delhi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'bold',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const WidthGap(gap: 0.01),
                            ShaderMask(
                              shaderCallback: (bounds) =>
                                  const LinearGradient(
                                    colors: [darkThemeColor, mediumThemeColor],
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
                              child: const Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ShaderMask(
                          shaderCallback: (bounds) =>
                              const LinearGradient(
                                colors: [darkThemeColor, mediumThemeColor],
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
                          child: Image.asset(AppAssets.noti, height: 22),
                        ),
                      ),
                    ],
                  ),
                ),
                const HeightGap(gap: 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context) * 0.03,
                  ),
                  child: MyTextformField(
                    filledColor: Colors.white70,
                    hintText: 'Search Spa, Services...',
                    prefix: const Icon(CupertinoIcons.search, color: themeGrey),
                    onChanged: (query) {
                      ref
                          .read(productController.notifier)
                          .filterProductList(query);
                    },
                  ),
                ),
                const HeightGap(gap: 0.01),
                Expanded(
                  child: productState.isLoading
                      ? const Center(child: CustomProgressIndicator())
                      : productState.restaurants.isEmpty
                      ? const Center(
                          child: Text(
                            'No product found...try searching different keywords',
                            textAlign: TextAlign.center,
                          ),
                        )
                      : ListView.builder(
                          itemCount: productState.restaurants.length,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth(context) * 0.03,
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            final data = productState.restaurants[index];
                            return ProductListTile(data: data);
                          },
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
