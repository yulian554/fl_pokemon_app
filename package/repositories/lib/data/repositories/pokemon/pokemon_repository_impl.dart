
import 'package:commons/domain/entities/pokemon/pokemon_detail_entity.dart';
import 'package:commons/domain/entities/pokemon/pokemons_entity.dart';
import 'package:repositories/domain/datasources/pokemon/pokemon_datasource.dart';
import 'package:repositories/domain/repositories/pokemon/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {

  final PokemonDatasource datasource;

  PokemonRepositoryImpl({
    required this.datasource
  });

  @override
  Future<PokemonsEntity> getListPokemons(String limit, String offset) {
    return datasource.getListPokemons(limit, offset);
  }

  @override
  Future<PokemonDetailEntity> getPokemonDetail(String url) {
    return datasource.getPokemonDetail(url);
  }
  
  @override
  Future<PokemonDetailEntity> getPokemonByName(String name) {
    return datasource.getPokemonByName(name);
  }

  
}