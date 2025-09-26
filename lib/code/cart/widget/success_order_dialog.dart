import 'package:ecommercetask/code/cart/controller/cart_controller.dart';
import 'package:ecommercetask/code/product/screens/product_list_screen.dart';
import 'package:ecommercetask/common/buttons.dart';
import 'package:ecommercetask/common/dimesions.dart';
import 'package:ecommercetask/common/navigation.dart';
import 'package:ecommercetask/constants/app_assets.dart';
import 'package:ecommercetask/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SuccessOrderDialog extends StatelessWidget {
  const SuccessOrderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.034),
        width: screenWidth(context) * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HeightGap(gap: 0.02),
            Image.asset(AppAssets.success, height: 120),
            const HeightGap(gap: 0.02),
            const Text(
              'Your Order is Confirmed!',
              style: TextStyle(
                color: Colors.black,
                height: 1.2,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const HeightGap(gap: 0.02),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Thank you for choosing Oasis Spa Haven. Your appointment for ',
                    style: TextStyle(color: Colors.black, height: 1.2),
                  ),
                  TextSpan(
                    text: 'Swedish Massage and Hot Stone Massage',
                    style: TextStyle(color: themeColor, height: 1.2),
                  ),
                  TextSpan(
                    text: ' has been successfully booked.',
                    style: TextStyle(color: Colors.black, height: 1.2),
                  ),
                ],
              ),
            ),
            const HeightGap(gap: 0.02),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(context) * (0.03),
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: lightThemeColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Your appointment on Thursday, 7 Mar 2024 at 8:00 AM',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontFamily: 'semibold'),
              ),
            ),
            const HeightGap(gap: 0.02),

            Consumer(
              builder: (context, ref, _) {
                return MyButton(
                  onTap: () {
                    ref.read(cartController.notifier).clearCart();
                    NavigationService.removePreviousRoutes(
                      const ProductListScreen(),
                      direction: SlideDirection.bottom,
                    );
                  },
                  buttonText: 'Done',
                );
              },
            ),
            const HeightGap(gap: 0.02),
          ],
        ),
      ),
    );
  }
}
