import 'package:commons/domain/entities/pokemon/pokemon_detail_entity.dart';

abstract class GetPokemonByNameUseCase {

  Future<(PokemonDetailEntity?, String?)> invoke(String name);
  
}