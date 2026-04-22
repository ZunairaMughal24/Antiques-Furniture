import 'package:antiques_furniture/features/categories/presentation/screens/categories_screen.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:antiques_furniture/features/home/presentation/screens/product_detail_screen.dart';
import 'package:antiques_furniture/features/login/presentation/screens/login_screen.dart';
import 'package:antiques_furniture/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:antiques_furniture/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:antiques_furniture/home.dart';
import 'package:antiques_furniture/features/favorites/presentation/screens/wishlist_screen.dart';
import 'package:antiques_furniture/features/splash/presentation/screens/splash_screen.dart';
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
  static const String onboardingScreenRoute = '/onboarding';
  static const String productDetailRoute = '/product_detail';
  static const String categoriesScreenRoute = '/categories_screen';
  static const String cartScreenRoute = '/cart_screen';
  static const String signUpScreenRoute = '/sign_up';
  static const String loginScreenRoute = '/login';
  static const String homeScreenRoute = '/home';
  static const String profile = '/profile';
  static const String detail = '/detail';
  static const String terms = '/terms';
  static const String privacy = '/privacy';
  static const String wishlistRoute = '/wishlist';
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
      path: AppRoutes.onboardingScreenRoute,
      pageBuilder: (context, state) => buildSlideTransition(
        context: context,
        state: state,
        child: OnboardingScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.loginScreenRoute,
      pageBuilder: (context, state) => buildSlideTransition(
        context: context,
        state: state,
        child: const SignInScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.signUpScreenRoute,
      pageBuilder: (context, state) => buildSlideTransition(
        context: context,
        state: state,
        child: const SignUpScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.homeScreenRoute,
      pageBuilder: (context, state) => buildSlideTransition(
        context: context,
        state: state,
        child: const HomePage(),
      ),
    ),

    GoRoute(
      path: AppRoutes.productDetailRoute,
      builder: (context, state) {
        if (state.extra is Map<String, dynamic>) {
          final data = state.extra as Map<String, dynamic>;
          return ProductDetailScreen(
            product: data['product'] as ProductEntity,
            heroTag: data['heroTag'] as String?,
          );
        }
        final product = state.extra as ProductEntity;
        return ProductDetailScreen(product: product);
      },
    ),
    GoRoute(
      path: AppRoutes.categoriesScreenRoute,
      builder: (context, state) {
        return CategoryScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.wishlistRoute,
      builder: (context, state) {
        return const WishlistScreen();
      },
    ),
  ],
);
