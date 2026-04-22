import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/core/usecases/usecase.dart';
import 'package:antiques_furniture/features/home/domain/entities/banner_entity.dart';
import 'package:antiques_furniture/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetBannersUseCase implements UseCase<List<BannerEntity>, NoParams> {
  final HomeRepository repository;

  GetBannersUseCase(this.repository);

  @override
  Future<Either<Failure, List<BannerEntity>>> call(NoParams params) async {
    return await repository.getBanners();
  }
}
