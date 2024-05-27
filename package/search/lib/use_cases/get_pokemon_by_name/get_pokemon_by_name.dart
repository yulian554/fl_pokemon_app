import 'package:fl_core_pokemon/domain/entities/pokemon/pokemon_detail_entity.dart';

abstract class GetPokemonByNameUseCase {
  Future<(PokemonDetailEntity?, String?)> invoke(String name);
}
