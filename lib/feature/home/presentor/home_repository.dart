import 'package:dartz/dartz.dart';
import 'package:mvp_arch/core/error/failure.dart';

import '../data/model/character_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CharacterModel>>> getCharacters();
}
