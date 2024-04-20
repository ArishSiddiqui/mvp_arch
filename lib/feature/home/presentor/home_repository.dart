import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../data/model/character_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CharacterModel>>> getCharacters();
}
