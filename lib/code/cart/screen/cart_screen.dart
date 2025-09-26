import 'package:ecommercetask/code/cart/controller/cart_controller.dart';
import 'package:ecommercetask/code/cart/widget/cart_product_tile.dart';
import 'package:ecommercetask/code/cart/widget/success_order_dialog.dart';
import 'package:ecommercetask/common/buttons.dart';
import 'package:ecommercetask/common/dimesions.dart';
import 'package:ecommercetask/constants/app_assets.dart';
import 'package:ecommercetask/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartController);
    final notifier = ref.watch(cartController.notifier);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        scrolledUnderElevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomBackButton(color: Color.fromARGB(255, 215, 205, 186)),
        ),
      ),
      body: state.cartList.isEmpty
          ? Center(
              child: ShaderMask(
                shaderCallback: (bounds) =>
                    const LinearGradient(
                      colors: [darkThemeColor, mediumThemeColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_basket_rounded,
                      color: Colors.white,
                      size: 100,
                    ),
                    Text(
                      'Cart is empty',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'semibold',
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.grey.shade100),
                  const HeightGap(gap: 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) * 0.03,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Your Services Order',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: '',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
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
                            '+ Add more',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: state.cartList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) * 0.03,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final data = state.cartList[index];
                      return CartProductTile(cart: data);
                    },
                  ),
                  const HeightGap(gap: 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) * 0.03,
                    ),
                    child: const Text(
                      'Offer & Discounts',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: '',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const HeightGap(gap: 0.01),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) * 0.03,
                      vertical: 12,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) * 0.03,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade100,
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(AppAssets.discount, height: 27),
                        const WidthGap(gap: 0.02),
                        const Text(
                          'Apply Coupon',
                          style: TextStyle(
                            fontFamily: '',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.sort_by_alpha),
                      ],
                    ),
                  ),
                  const HeightGap(gap: 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) * 0.03,
                    ),
                    child: const Text(
                      'Payment Summary',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: '',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const HeightGap(gap: 0.01),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) * 0.03,
                      vertical: 8,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) * 0.03,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade100,
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Selected Services',
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
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
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                                size: 17,
                              ),
                            ),

                            const Spacer(),
                            Text(
                              '₹${notifier.getTotalCartPrice()}',
                              style: const TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Colors.grey.shade300),
                        const HeightGap(gap: 0.007),
                        const Row(
                          children: [
                            Text(
                              'Additional Fee',
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            Spacer(),
                            Text(
                              '₹10',
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const HeightGap(gap: 0.007),
                        const Row(
                          children: [
                            Text(
                              'Convenience Fee',
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            Spacer(),
                            Text(
                              '₹4',
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Colors.grey.shade300),
                        const HeightGap(gap: 0.007),
                        Row(
                          children: [
                            const Text(
                              'Payable Amount',
                              style: TextStyle(
                                fontFamily: '',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const Spacer(),
                            Text(
                              '₹${notifier.getTotalCartPrice() + 14}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: '',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                      Text('Total ₹${notifier.getTotalCartPrice() + 14}'),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const SuccessOrderDialog(),
                          );
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
                            'Pay',
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
