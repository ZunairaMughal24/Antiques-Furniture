import 'package:antiques_furniture/features/cart/presentation/screens/cart_screen.dart';
import 'package:antiques_furniture/features/categories/presentation/screens/categories_screen.dart';
import 'package:antiques_furniture/features/home/domain/models/home_model.dart';
import 'package:antiques_furniture/features/home/domain/models/new_collection_model.dart';
import 'package:antiques_furniture/features/home/presentation/screens/home_screen.dart';
import 'package:antiques_furniture/features/home/presentation/screens/new_collection_detail_screen.dart';
import 'package:antiques_furniture/features/home/presentation/screens/popular_items_detail_screen.dart';
import 'package:antiques_furniture/features/login/presentation/screens/login_screen.dart';
import 'package:antiques_furniture/features/sign_up/presentation/screens/sign_up_screen.dart';

import 'package:antiques_furniture/home.dart';
import 'package:antiques_furniture/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<void> buildSlideTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      final tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}

abstract class AppRoutes {
  static const String splashScreenRoute = '/splash_screen';
  static const String popularItemsDetailScreenRoute = '/product_detail';
  static const String newColectionDetailScreenRoute = '/new_collection_detail';
  static const String categoriesScreenRoute = '/categories_screen';
  static const String cartScreenRoute = '/cart_screen';
  static const String signUpScreenRoute = '/sign_up';
  static const String loginScreenRoute = '/login';
  static const String homeScreenRoute = '/home';
  static const String profile = '/profile';
  static const String detail = '/detail';
  static const String terms = '/terms';
  static const String privacy = '/privacy';
}


final router = GoRouter(
  initialLocation: AppRoutes.splashScreenRoute,
  routes: [
    GoRoute(
      path: AppRoutes.splashScreenRoute,
      pageBuilder: (context, state) => buildSlideTransition(
        context: context,
        state: state,
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.loginScreenRoute,
      pageBuilder: (context, state) =>
          buildSlideTransition(
            context: context,
            state: state,
            child: const SignInScreen()),
    ),
      GoRoute(
      path: AppRoutes.signUpScreenRoute,
      pageBuilder: (context, state) =>
          buildSlideTransition(
            context: context,
            state: state,
            child: const SignUpScreen()),
    ),
    GoRoute(
      path: AppRoutes.homeScreenRoute,
      pageBuilder: (context, state) => buildSlideTransition(
        context: context,
        state: state,
        child: const HomePage(),
      ),
    ),

    // GoRoute(
    //   path: AppRoutes.profile,
    //   pageBuilder: (context, state) =>
    //       buildSlideTransition(context: context, state: state, child: const ProfileScreen()),
    // ),
    // GoRoute(
    //   path: AppRoutes.detail,
    //   pageBuilder: (context, state) =>
    //       buildSlideTransition(context: context, state: state, child: const DetailScreen()),
    // ),
    GoRoute(
      path: AppRoutes.popularItemsDetailScreenRoute,
      builder: (context, state) {
        final product = state.extra as HomeItemModel;
        return ProductDetailScreen(product: product);
      },
    ),
    GoRoute(
      path: AppRoutes.newColectionDetailScreenRoute,
      builder: (context, state) {
        final product = state.extra as NewCollectionModel;
        return NewCollectionDetailScreen(product: product);
      },
    ),
    GoRoute(
      path: AppRoutes.categoriesScreenRoute,
      builder: (context, state) {
        final product = state.extra as HomeItemModel;
        return CategoryScreen();
      },
    ),
      GoRoute(
      path: AppRoutes.cartScreenRoute,
      builder: (context, state) {
        final product = state.extra as HomeItemModel;
        return CartScreen();
      },
    ),
  ],
);
