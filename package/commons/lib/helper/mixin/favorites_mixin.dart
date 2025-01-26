import 'package:commons/services/locator_service.dart';
import 'package:fl_core_pokemon/domain/entities/pokemon/pokemon_detail_entity.dart';
import 'package:fl_core_pokemon/domain/use_case/favorites_pokemons/favorites_pokemons_use_case.dart';

mixin FavoritesMixin {
  final _favoritesUseCase = locator.get<FavoritesPokemonsUseCase>();

  Future<bool> validateFavorite(String pokemonName) async {
    final list = await _favoritesUseCase.getFavoritesPokemons();
    final pokemon = list.where((i) => i.name == pokemonName);
    return pokemon.isNotEmpty;
  }

  Future<bool> changeFavorites(PokemonDetailEntity pokemon) async {
    final pokemons = await _favoritesUseCase.getFavoritesPokemons();
    final pokemonResult = pokemons.firstWhere(
      (item) => item.name == pokemon.name,
      orElse: () => PokemonDetailEntity(
        name: '',
        sprites: SpritesEntity(frontDefault: ''),
      ),
    );

    if (pokemonResult.name.isNotEmpty) {
      return _favoritesUseCase.deleteFavoritePokemon(namePokemon: pokemonResult.name);
    }

    return await _favoritesUseCase.saveFavoritePokemon(data: pokemon);
  }

  Future<List<PokemonDetailEntity>> getFavoritesPokemons() {
    return _favoritesUseCase.getFavoritesPokemons();
  }
}
