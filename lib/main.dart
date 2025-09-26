import 'package:ecommercetask/code/cart/model/cart_model.dart';
import 'package:ecommercetask/code/location/location_permission_page.dart';
import 'package:ecommercetask/common/navigation.dart';
import 'package:ecommercetask/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  await Hive.openBox<CartModel>('cartBox');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      title: 'An Ecommerce Task',
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context).copyWith(
          textScaler: const TextScaler.linear(1.0),
          boldText: false,
          highContrast: false,
        );
        return MediaQuery(
          data: mediaQueryData,
          child: SafeArea(top: false, bottom: true, child: child!),
        );
      },
      theme: ThemeData(
        fontFamily: 'medium',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'semibold',
          ),
          bodyLarge: TextStyle(color: Colors.black, fontFamily: 'semibold'),
          bodyMedium: TextStyle(color: Colors.black, fontFamily: 'medium'),
          bodySmall: TextStyle(color: Colors.black, fontFamily: 'regular'),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
      ),
      home: const LocationPermissionPage(),
    );
  }
}
