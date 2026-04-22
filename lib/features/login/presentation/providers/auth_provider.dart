import 'package:antiques_furniture/core/usecases/usecase.dart';
import 'package:antiques_furniture/features/login/domain/entities/user_entity.dart';
import 'package:antiques_furniture/features/login/domain/usecases/login_usecase.dart';
import 'package:antiques_furniture/features/login/domain/usecases/logout_usecase.dart';
import 'package:antiques_furniture/features/login/domain/usecases/sign_up_usecase.dart';
import 'package:flutter/material.dart';

enum AuthState { unauthenticated, authenticating, authenticated, error }

class AuthProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;
  final LogoutUseCase logoutUseCase;

  AuthProvider({
    required this.loginUseCase,
    required this.signUpUseCase,
    required this.logoutUseCase,
  });

  AuthState _state = AuthState.unauthenticated;
  AuthState get state => _state;

  UserEntity? _user;
  UserEntity? get user => _user;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  void clearError() {
    if (_errorMessage.isNotEmpty) {
      _errorMessage = '';
      _state = AuthState.unauthenticated;
      notifyListeners();
    }
  }

  Future<bool> login(String email, String password) async {
    _errorMessage = '';
    _state = AuthState.authenticating;
    notifyListeners();

    final result = await loginUseCase(
      LoginParams(email: email, password: password),
    );

    return result.fold(
      (failure) {
        _state = AuthState.error;
        _errorMessage = failure.message;
        notifyListeners();
        return false;
      },
      (user) {
        _user = user;
        _state = AuthState.authenticated;
        notifyListeners();
        return true;
      },
    );
  }

  Future<bool> signUp(String name, String email, String password) async {
    _errorMessage = '';
    _state = AuthState.authenticating;
    notifyListeners();

    final result = await signUpUseCase(
      SignUpParams(name: name, email: email, password: password),
    );

    return result.fold(
      (failure) {
        _state = AuthState.error;
        _errorMessage = failure.message;
        notifyListeners();
        return false;
      },
      (user) {
        _user = user;
        _state = AuthState.authenticated;
        notifyListeners();
        return true;
      },
    );
  }

  Future<bool> logout() async {
    final result = await logoutUseCase(NoParams());

    return result.fold(
      (failure) {
        _errorMessage = failure.message;
        notifyListeners();
        return false;
      },
      (_) {
        _user = null;
        _state = AuthState.unauthenticated;
        _errorMessage = '';
        notifyListeners();
        return true;
      },
    );
  }
}
