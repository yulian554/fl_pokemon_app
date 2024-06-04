import 'package:commons/services/locator_service.dart';
import 'package:fl_core_pokemon/domain/entities/pokemon/pokemon_detail_entity.dart';
import 'package:fl_core_pokemon/domain/use_case/favorites_pokemons/favorites_pokemons_use_case.dart';

mixin FavoritesMixin {
  final _favoritesUseCase = locator.get<FavoritesPokemonsUseCase>();

  Future<bool> validateFavorite(String pokemonName) async {
    final list = await _favoritesUseCase.getFavoritesPokemons();
    final pokemon = list.where((i) {
      return i.name == pokemonName;
    });
    return pokemon.isNotEmpty;
  }

  Future<void> changeFavorites(String pokemonName, String image) async {
    await _favoritesUseCase.saveFavoritesPokemons(
        'pokemons', pokemonName, image);
  }

  Future<List<PokemonDetailEntity>> getFavoritesPokemons() {
    return _favoritesUseCase.getFavoritesPokemons();
  }
}
