import '../../../core/const/app_const.dart';
import '../../../core/custom/custom.dart';
import '../../../core/error/exceptions.dart';
import 'model/character_model.dart';
import 'package:dio/dio.dart';

abstract class HomeDataSource {
  Future<List<CharacterModel>> fetchCharacters();
}

class HomeDataSourceImpl implements HomeDataSource {
  final Dio _dio = Dio();
  @override
  Future<List<CharacterModel>> fetchCharacters() async {
    List<CharacterModel> allCharacters = <CharacterModel>[];
    final response = await _dio.request(
      '$baseUrl/characters',
      options: Options(
        method: 'GET',
        
      ),
    );
    if (response.statusCode == 200) {
      CustomLogger.pP(response.data);
      for (var d in response.data['characters']) {
        final CharacterModel character = CharacterModel.fromJson(d);
        allCharacters.add(character);
      }
      return allCharacters;
    } else {
      throw const ServerException('Failed to get all Characters');
    }
  }
}
