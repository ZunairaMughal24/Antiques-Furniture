import 'package:antiques_furniture/config/router.dart';
import 'package:antiques_furniture/core/const/app_theme.dart';
import 'package:antiques_furniture/features/cart/presentation/providers/cart_provider.dart';
import 'package:antiques_furniture/features/home/presentation/providers/home_provider.dart';
import 'package:antiques_furniture/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:antiques_furniture/features/categories/presentation/providers/categories_provider.dart';
import 'package:antiques_furniture/features/login/presentation/providers/auth_provider.dart';
import 'package:antiques_furniture/core/di/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<HomeProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<CartProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<OnboardingProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<CategoriesProvider>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
