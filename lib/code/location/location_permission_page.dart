import 'package:ecommercetask/code/product/screens/product_list_screen.dart';
import 'package:ecommercetask/common/buttons.dart';
import 'package:ecommercetask/common/dimesions.dart';
import 'package:ecommercetask/common/navigation.dart';
import 'package:ecommercetask/constants/app_assets.dart';
import 'package:ecommercetask/constants/colors.dart';
import 'package:flutter/material.dart';

class LocationPermissionPage extends StatelessWidget {
  const LocationPermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white54,
              Colors.white54,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(context) * 0.05,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context) * 0.03,
                  vertical: screenHeight(context) * 0.07,
                ),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color.fromARGB(6, 0, 0, 0),
                    width: 3,
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(AppAssets.locationPermission, height: 100),
                    const HeightGap(gap: 0.02),
                    const Text(
                      'Enable Your Location',
                      style: TextStyle(fontSize: 24),
                    ),
                    const HeightGap(gap: 0.005),
                    const Text(
                      'Please allow to use your location to show nearby Saloons on the map.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    const HeightGap(gap: 0.034),
                    MyButton(
                      onTap: () {
                        NavigationService.changeScreen(
                          const ProductListScreen(),
                        );
                      },
                      buttonText: 'Enable Location',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
