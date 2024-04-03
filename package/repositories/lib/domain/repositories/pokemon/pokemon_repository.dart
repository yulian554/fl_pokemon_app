import 'package:commons/domain/entities/pokemon/pokemon_detail_entity.dart';
import 'package:commons/domain/entities/pokemon/pokemons_entity.dart';

abstract class PokemonRepository {

  Future<PokemonsEntity> getListPokemons(String limit, String offset);

  Future<PokemonDetailEntity> getPokemonDetail(String url);

  Future<PokemonDetailEntity> getPokemonByName(String name);
  
}