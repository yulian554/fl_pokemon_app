import 'package:commons/domain/entities/pokemon/pokemon_detail_entity.dart';

abstract class GetAllPokemonsUseCase {
  Future<List<PokemonDetailEntity>> invoke(String limit, String offset);
}
