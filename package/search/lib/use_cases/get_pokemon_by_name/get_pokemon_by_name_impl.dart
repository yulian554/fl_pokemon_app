import 'package:fl_core_pokemon/utils/web_error.dart';
import 'package:search/use_cases/get_pokemon_by_name/get_pokemon_by_name.dart';
import 'package:fl_core_pokemon/domain/entities/pokemon/pokemon_detail_entity.dart';
import 'package:fl_core_pokemon/domain/repositories/pokemon/pokemon_repository.dart';
import 'package:fl_core_pokemon/data/data_source/pokemon/pokemon_datasource_impl.dart';
import 'package:fl_core_pokemon/data/repositories/pokemon/pokemon_repository_impl.dart';

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
