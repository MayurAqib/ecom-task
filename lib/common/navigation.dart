import 'package:flutter/material.dart';

enum SlideDirection { left, right, top, bottom }

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static void pop<T extends Object?>([T? result]) {
    navigatorKey.currentState?.pop(result);
  }

  static Future<void> changeScreen(
    Widget page, {
    SlideDirection direction = SlideDirection.right,
  }) {
    return navigatorKey.currentState!.push(
      SlideTransitionPageRoute(
        page: page,
        direction: direction,
        duration: const Duration(milliseconds: 600),
      ),
    );
  }

  static Future<void> replaceScreen(
    Widget page, {
    SlideDirection direction = SlideDirection.right,
  }) {
    return navigatorKey.currentState!.pushReplacement(
      SlideTransitionPageRoute(
        page: page,
        direction: direction,
        duration: const Duration(milliseconds: 600),
      ),
    );
  }

  static Future<void> removePreviousRoutes(
    Widget page, {
    SlideDirection direction = SlideDirection.right,
  }) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      SlideTransitionPageRoute(
        page: page,
        direction: direction,
        duration: const Duration(milliseconds: 600),
      ),
      (Route<dynamic> route) => false,
    );
  }

  static BuildContext? get context => navigatorKey.currentContext;
}

class SlideTransitionPageRoute extends PageRouteBuilder {
  final Widget page;
  final SlideDirection direction;
  final Duration duration;

  SlideTransitionPageRoute({
    required this.page,
    this.direction = SlideDirection.right,
    this.duration = const Duration(milliseconds: 800),
  }) : super(
         transitionDuration: duration,
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           Offset begin;
           switch (direction) {
             case SlideDirection.left:
               begin = const Offset(-1.0, 0.0);
               break;
             case SlideDirection.right:
               begin = const Offset(1.0, 0.0);
               break;
             case SlideDirection.top:
               begin = const Offset(0.0, -1.0);
               break;
             case SlideDirection.bottom:
               begin = const Offset(0.0, 1.0);
               break;
           }
           const end = Offset.zero;
           const curve = Curves.ease;

           var tween = Tween(
             begin: begin,
             end: end,
           ).chain(CurveTween(curve: curve));
           var offsetAnimation = animation.drive(tween);

           return SlideTransition(position: offsetAnimation, child: child);
         },
       );
}
