import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/features/login/data/datasources/auth_datasource.dart';
import 'package:antiques_furniture/features/login/domain/entities/user_entity.dart';
import 'package:antiques_furniture/features/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, UserEntity>> login(String email, String password) async {
    try {
      final user = await dataSource.login(email, password);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(String name, String email, String password) async {
    try {
      final user = await dataSource.signUp(name, email, password);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await dataSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
