import 'package:repositories/utils/web_error.dart';
import 'package:commons/domain/entities/pokemon/pokemon_detail_entity.dart';
import 'package:search/use_cases/get_pokemon_by_name/get_pokemon_by_name.dart';
import 'package:repositories/domain/repositories/pokemon/pokemon_repository.dart';
import 'package:repositories/data/datasource/pokemon/pokemon_datasource_impl.dart';
import 'package:repositories/data/repositories/pokemon/pokemon_repository_impl.dart';

class GetPokemonByNameUseCaseImpl implements GetPokemonByNameUseCase {
  PokemonRepository? repository;

  GetPokemonByNameUseCaseImpl({this.repository}) {
    repository = PokemonRepositoryImpl(datasource: PokemonDatasourceImpl());
  }

  @override
  Future<(PokemonDetailEntity?, String?)> invoke(String name) async {
    try {
      if (name.isEmpty) return (null, '');
      final newPokemon = await repository?.getPokemonByName(name);
      return (newPokemon, '');
    } on WebExecption catch (error) {
      return (null, error.message);
    }
  }
}
