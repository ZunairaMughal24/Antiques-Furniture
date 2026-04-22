import 'package:antiques_furniture/features/login/domain/entities/user_entity.dart';

abstract class AuthDataSource {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> signUp(String name, String email, String password);
  Future<void> logout();
}

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<UserEntity> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'test@example.com' && password == 'password123') {
      return const UserEntity(id: '1', email: 'test@example.com', name: 'John Doe');
    } else {
      throw Exception('Invalid email or password');
    }
  }

  @override
  Future<UserEntity> signUp(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return UserEntity(id: '2', email: email, name: name);
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
