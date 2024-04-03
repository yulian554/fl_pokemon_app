import 'package:dio/dio.dart';
import 'package:repositories/infrastructure/utils/web_error.dart';
import 'package:commons/domain/entities/pokemon/pokemons_entity.dart';
import 'package:commons/domain/entities/pokemon/pokemon_detail_entity.dart';
import 'package:repositories/infrastructure/models/pokemon/pokemons_model.dart';
import 'package:repositories/domain/datasources/pokemon/pokemon_datasource.dart';
import 'package:repositories/infrastructure/models/pokemon/pokemon_detail_model.dart';

class PokemonDatasourceImpl implements PokemonDatasource {
  final _dio = Dio();

  @override
  Future<PokemonsEntity> getListPokemons(String limit, String offset) async {
    final response = await _dio
        .get('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset');
    if (response.statusCode == 200) {
      var data = PokemonsModel.fromJson(response.data);
      return data.toPokemonsEntity();
    } else {
      throw WebExecption(message: 'Failure get all pokémons');
    }
  }

  @override
  Future<PokemonDetailEntity> getPokemonDetail(String url) async {
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      var data = PokemonDetailModel.fromJson(response.data);
      return data.toPokemonDetailEntity();
    } else {
      throw WebExecption(message: 'Failure get pokémon');
    }
  }

  @override
  Future<PokemonDetailEntity> getPokemonByName(String name) async {
    try {
      final response =
          await _dio.get('https://pokeapi.co/api/v2/pokemon/$name');
      if (response.statusCode == 200) {
        var data = PokemonDetailModel.fromJson(response.data);
        return data.toPokemonDetailEntity();
      } else {
        throw WebExecption(message: 'Failure get pokémon');
      }
    } catch (e) {
      throw WebExecption(message: 'Failure get pokémon');
    }
  }
}
