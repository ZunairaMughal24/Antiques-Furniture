import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/features/login/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, UserEntity>> signUp(String name, String email, String password);
  Future<Either<Failure, void>> logout();
}
