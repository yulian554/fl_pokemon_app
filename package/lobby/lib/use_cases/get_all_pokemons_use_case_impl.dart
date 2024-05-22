import 'package:lobby/use_cases/get_all_pokemons_use_case.dart';
import 'package:commons/domain/entities/pokemon/pokemon_detail_entity.dart';
import 'package:repositories/domain/repositories/pokemon/pokemon_repository.dart';
import 'package:repositories/data/datasource/pokemon/pokemon_datasource_impl.dart';
import 'package:repositories/data/repositories/pokemon/pokemon_repository_impl.dart';

class GetAllPokemonsUseCaseImpl implements GetAllPokemonsUseCase {
  PokemonRepository? repository;

  GetAllPokemonsUseCaseImpl({this.repository}) {
    repository = PokemonRepositoryImpl(datasource: PokemonDatasourceImpl());
  }

  @override
  Future<List<PokemonDetailEntity>> invoke(String limit, String offset) async {
    final pokemons = await repository?.getListPokemons(limit, offset);
    final List<String> urls =
        pokemons?.results.map((e) => e.url).toList() ?? [];
    final newPokemonList = await _getAllPokemon(urls);
    return newPokemonList;
  }

  Future<List<PokemonDetailEntity>> _getAllPokemon(List<String> urls) async {
    List<PokemonDetailEntity> newPokemonList = [];
    if (urls.isNotEmpty) {
      for (var i = 0; i < urls.length; i++) {
        final url = urls[i];
        var pokemon = await _getPokemon(url);
        if (pokemon != null) newPokemonList.add(pokemon);
      }
    }
    return newPokemonList;
  }

  Future<PokemonDetailEntity?> _getPokemon(String url) async {
    final pokemon = await repository?.getPokemonDetail(url);
    return pokemon;
  }
}
