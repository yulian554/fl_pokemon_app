import 'package:commons/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:commons/helper/mixin/favorites_mixin.dart';
import 'package:lobby/use_cases/get_all_pokemons_use_case.dart';
import 'package:lobby/use_cases/get_all_pokemons_use_case_impl.dart';
import 'package:fl_core_pokemon/domain/entities/pokemon/pokemon_detail_entity.dart';

class HomePresenter extends ChangeNotifier with FavoritesMixin {
  int limit = 10;
  int offset = 0;
  bool isLoading = false;
  GetAllPokemonsUseCase? getAllPokemonsUseCase;
  List<PokemonDetailEntity> pokemonList = [];

  HomePresenter({this.getAllPokemonsUseCase}) {
    getAllPokemonsUseCase = GetAllPokemonsUseCaseImpl();
  }

  Future<void> loadPageDefault() async {
    isLoading = limit > 0;
    notifyListeners();
    offset = limit;
    limit += 10;

    final newPokemonList = await getAllPokemonsUseCase?.invoke(
      offset: offset.toString(),
    );

    isLoading = false;
    final List<PokemonDetailEntity> list = [];
    if (newPokemonList != null) {
      for (var item in newPokemonList) {
        final bool isFavorite = await validateFavorite(item.name);
        list.add(
          PokemonDetailEntity(
            name: item.name,
            sprites: item.sprites,
            isFavorite: isFavorite,
          ),
        );
      }
      pokemonList.addAll(list);
      notifyListeners();
    }
  }

  Future<void> loadPageSpecific(String limit, String offset) async {
    final newPokemonList = await getAllPokemonsUseCase?.invoke(limit: limit, offset: offset);
    isLoading = false;
    final List<PokemonDetailEntity> list = [];
    if (newPokemonList != null) {
      for (var item in newPokemonList) {
        final bool isFavorite = await validateFavorite(item.name);
        list.add(
          PokemonDetailEntity(
            name: item.name,
            sprites: item.sprites,
            isFavorite: isFavorite,
          ),
        );
      }
      pokemonList.clear();
      pokemonList.addAll(list);
      notifyListeners();
    }
  }

  void initChangeFavorites({
    required PokemonDetailEntity pokemonEntity,
    required int index,
  }) async {
    await changeFavorites(pokemonEntity);
    final pokemon =
        pokemonList.firstWhere((pokemon) => pokemon.name == pokemonEntity.name);
    final bool isFavorite = await validateFavorite(pokemon.name);
    pokemonList.update(
      index,
      PokemonDetailEntity(
        name: pokemon.name,
        sprites: pokemon.sprites,
        isFavorite: isFavorite,
      ),
    );
    notifyListeners();
  }
}
