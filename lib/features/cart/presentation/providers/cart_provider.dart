import 'package:antiques_furniture/features/cart/domain/entities/cart_entity.dart';
import 'package:antiques_furniture/features/cart/domain/entities/cart_item_entity.dart';
import 'package:antiques_furniture/features/cart/domain/usecases/calculate_cart_totals_usecase.dart';
import 'package:antiques_furniture/features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:antiques_furniture/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:antiques_furniture/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:antiques_furniture/features/cart/domain/usecases/delete_from_cart_usecase.dart';
import 'package:antiques_furniture/core/usecases/usecase.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

enum CartState { initial, loading, loaded, error }

class CartProvider extends ChangeNotifier {
  final GetCartItemsUseCase getCartItemsUseCase;
  final CalculateCartTotalsUseCase calculateCartTotalsUseCase;
  final AddToCartUseCase addToCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  final DeleteFromCartUseCase deleteFromCartUseCase;

  CartProvider({
    required this.getCartItemsUseCase,
    required this.calculateCartTotalsUseCase,
    required this.addToCartUseCase,
    required this.removeFromCartUseCase,
    required this.deleteFromCartUseCase,
  });

  CartState _state = CartState.initial;
  CartState get state => _state;

  CartEntity _cart = const CartEntity();
  CartEntity get cart => _cart;

  List<CartItemEntity> get items => _cart.items;

  bool isInCart(String productId) {
    return _cart.items.any((item) => item.product.id == productId);
  }

  CartTotals get totals => calculateCartTotalsUseCase(_cart.items);

  double get subtotal => totals.subtotal;
  double get shipping => totals.shipping;
  double get total => totals.total;

  Future<void> loadCart() async {
    _state = CartState.loading;
    notifyListeners();

    final result = await getCartItemsUseCase(NoParams());
    result.fold(
      (failure) => _state = CartState.error,
      (items) {
        _cart = CartEntity(items: items);
        _state = CartState.loaded;
      },
    );
    notifyListeners();
  }

  Future<void> addItem(ProductEntity product, {int quantity = 1}) async {
    final result = await addToCartUseCase(AddToCartParams(
      currentItems: _cart.items,
      product: product,
      quantity: quantity,
    ));

    result.fold(
      (failure) => _state = CartState.error,
      (newItems) {
        _cart = CartEntity(items: newItems);
      },
    );
    notifyListeners();
  }

  Future<void> removeItem(String productId) async {
    final result = await removeFromCartUseCase(RemoveFromCartParams(
      currentItems: _cart.items,
      productId: productId,
    ));

    result.fold(
      (failure) => _state = CartState.error,
      (newItems) {
        _cart = CartEntity(items: newItems);
      },
    );
    notifyListeners();
  }

  Future<void> deleteItem(String productId) async {
    final result = await deleteFromCartUseCase(DeleteFromCartParams(
      currentItems: _cart.items,
      productId: productId,
    ));

    result.fold(
      (failure) => _state = CartState.error,
      (newItems) {
        _cart = CartEntity(items: newItems);
      },
    );
    notifyListeners();
  }
}
