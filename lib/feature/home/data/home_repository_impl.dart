import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mvp_arch/core/error/exceptions.dart';
import 'package:mvp_arch/feature/home/data/home_data_source.dart';

import '../../../core/error/failure.dart';
import '../presentor/home_repository.dart';
import 'model/character_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;
  const HomeRepositoryImpl({
    required this.dataSource,
  });
  @override
  Future<Either<Failure, List<CharacterModel>>> getCharacters() async {
    try {
      final characters = await dataSource.fetchCharacters();
      return Right(characters);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return const Left(
          ServerFailure('Connection timed out. Please try again.'),
        );
      }
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
