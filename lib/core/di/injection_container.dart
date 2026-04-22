import 'package:antiques_furniture/features/cart/data/datasources/cart_datasource.dart';
import 'package:antiques_furniture/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:antiques_furniture/features/cart/domain/repositories/cart_repository.dart';
import 'package:antiques_furniture/features/onboarding/data/datasources/onboarding_datasource.dart';
import 'package:antiques_furniture/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:antiques_furniture/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:antiques_furniture/features/onboarding/domain/usecases/get_onboarding_slides_usecase.dart';
import 'package:antiques_furniture/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:antiques_furniture/features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:antiques_furniture/features/categories/data/repositories/photo_repository.dart';
import 'package:antiques_furniture/features/categories/domain/repositories/photo_repository.dart';
import 'package:antiques_furniture/features/categories/domain/usecases/get_photos_usecase.dart';
import 'package:antiques_furniture/features/categories/presentation/providers/categories_provider.dart';
import 'package:antiques_furniture/features/cart/domain/usecases/calculate_cart_totals_usecase.dart';
import 'package:antiques_furniture/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:antiques_furniture/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:antiques_furniture/features/cart/domain/usecases/delete_from_cart_usecase.dart';
import 'package:antiques_furniture/features/cart/presentation/providers/cart_provider.dart';
import 'package:antiques_furniture/features/home/data/datasources/home_datasource.dart';
import 'package:antiques_furniture/features/home/data/repositories/home_repository_impl.dart';
import 'package:antiques_furniture/features/home/domain/repositories/home_repository.dart';
import 'package:antiques_furniture/features/home/domain/usecases/get_banners_usecase.dart';
import 'package:antiques_furniture/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:antiques_furniture/features/home/domain/usecases/get_trending_products_usecase.dart';
import 'package:antiques_furniture/features/home/domain/usecases/get_products_by_category_usecase.dart';
import 'package:antiques_furniture/features/home/domain/usecases/search_products_usecase.dart';
import 'package:antiques_furniture/features/home/presentation/providers/home_provider.dart';
import 'package:antiques_furniture/features/login/data/datasources/auth_datasource.dart';
import 'package:antiques_furniture/features/login/data/repositories/auth_repository_impl.dart';
import 'package:antiques_furniture/features/login/domain/repositories/auth_repository.dart';
import 'package:antiques_furniture/features/login/domain/usecases/login_usecase.dart';
import 'package:antiques_furniture/features/login/domain/usecases/logout_usecase.dart';
import 'package:antiques_furniture/features/login/domain/usecases/sign_up_usecase.dart';
import 'package:antiques_furniture/features/login/presentation/providers/auth_provider.dart';
import 'package:antiques_furniture/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:antiques_furniture/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:antiques_furniture/features/favorites/domain/usecases/toggle_favorite_usecase.dart';
import 'package:antiques_furniture/features/favorites/domain/usecases/is_favorite_usecase.dart';
import 'package:antiques_furniture/features/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:antiques_furniture/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Home
  // Provider
  sl.registerFactory<HomeProvider>(() => HomeProvider(
        getBannersUseCase: sl(),
        getTrendingProductsUseCase: sl(),
        getCategoriesUseCase: sl(),
        getProductsByCategoryUseCase: sl(),
        searchProductsUseCase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton<GetBannersUseCase>(() => GetBannersUseCase(sl()));
  sl.registerLazySingleton<GetTrendingProductsUseCase>(() => GetTrendingProductsUseCase(sl()));
  sl.registerLazySingleton<GetCategoriesUseCase>(() => GetCategoriesUseCase(sl()));
  sl.registerLazySingleton<GetProductsByCategoryUseCase>(() => GetProductsByCategoryUseCase(sl()));
  sl.registerLazySingleton<SearchProductsUseCase>(() => SearchProductsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(),
  );

  //! Features - Auth
  // Provider
  sl.registerFactory<AuthProvider>(() => AuthProvider(
        loginUseCase: sl(),
        signUpUseCase: sl(),
        logoutUseCase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(sl()));
  sl.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(),
  );

  //! Features - Cart
  // Provider
  sl.registerFactory<CartProvider>(() => CartProvider(
        getCartItemsUseCase: sl(),
        calculateCartTotalsUseCase: sl(),
        addToCartUseCase: sl(),
        removeFromCartUseCase: sl(),
        deleteFromCartUseCase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton<GetCartItemsUseCase>(() => GetCartItemsUseCase(sl()));
  sl.registerLazySingleton<CalculateCartTotalsUseCase>(() => CalculateCartTotalsUseCase());
  sl.registerLazySingleton<AddToCartUseCase>(() => AddToCartUseCase(sl()));
  sl.registerLazySingleton<RemoveFromCartUseCase>(() => RemoveFromCartUseCase(sl()));
  sl.registerLazySingleton<DeleteFromCartUseCase>(() => DeleteFromCartUseCase(sl()));

  // Repository
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<CartDataSource>(
    () => CartDataSourceImpl(),
  );

  //! Features - Onboarding
  // Provider
  sl.registerFactory<OnboardingProvider>(() => OnboardingProvider(
        getOnboardingSlidesUseCase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton<GetOnboardingSlidesUseCase>(() => GetOnboardingSlidesUseCase(sl()));

  // Repository
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<OnboardingDataSource>(
    () => OnboardingDataSourceImpl(),
  );

  //! Features - Categories
  // Provider
  sl.registerFactory<CategoriesProvider>(() => CategoriesProvider(
        getPhotosUseCase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton<GetPhotosUseCase>(() => GetPhotosUseCase(sl()));

  // Repository
  sl.registerLazySingleton<IPhotoRepository>(
    () => PhotoRepositoryImpl(),
  );

  //! Features - Favorites
  // Provider
  sl.registerFactory<FavoritesProvider>(() => FavoritesProvider(
        toggleFavoriteUseCase: sl(),
        isFavoriteUseCase: sl(),
        getFavoritesUseCase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton<ToggleFavoriteUseCase>(() => ToggleFavoriteUseCase(sl()));
  sl.registerLazySingleton<IsFavoriteUseCase>(() => IsFavoriteUseCase(sl()));
  sl.registerLazySingleton<GetFavoritesUseCase>(() => GetFavoritesUseCase(sl()));

  // Repository
  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(),
  );
}
