import 'package:commons/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:commons/helper/mixin/favorites_mixin.dart';
import 'package:lobby/use_cases/get_all_pokemons_use_case.dart';
import 'package:lobby/use_cases/get_all_pokemons_use_case_impl.dart';
import 'package:fl_core_pokemon/domain/entities/pokemon/pokemon_detail_entity.dart';

class HomePresenter extends ChangeNotifier with FavoritesMixin {
  int limit = 0;
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
    final newPokemonList =
        await getAllPokemonsUseCase?.invoke('10', offset.toString());
    isLoading = false;
    final List<PokemonDetailEntity> list = [];
    if (newPokemonList != null) {
      for (var item in newPokemonList) {
        final bool isFavorite = await validateFavorite(item.name);
        list.add(
          PokemonDetailEntity(
              name: item.name, sprites: item.sprites, isFavorite: isFavorite),
        );
      }
      pokemonList.addAll(list);
      notifyListeners();
    }
  }

  Future<void> loadPageSpecific(String limit, String offset) async {
    final mLimit = getLimit(limit);
    final mOffset = getOffset(offset);
    final newPokemonList = await getAllPokemonsUseCase?.invoke(mLimit, mOffset);
    isLoading = false;
    final List<PokemonDetailEntity> list = [];
    if (newPokemonList != null) {
      for (var item in newPokemonList) {
        final bool isFavorite = await validateFavorite(item.name);
        list.add(
          PokemonDetailEntity(
              name: item.name, sprites: item.sprites, isFavorite: isFavorite),
        );
      }
      pokemonList.clear();
      pokemonList.addAll(list);
      notifyListeners();
    }
  }

  String getLimit(String limit) {
    if (int.tryParse(limit) != null) {
      this.limit = int.parse(limit);
      return limit;
    } else {
      this.limit = 10;
      return '10';
    }
  }

  String getOffset(String offset) {
    if (int.tryParse(offset) != null) {
      this.offset = int.parse(offset);
      return offset;
    } else {
      this.offset = 0;
      return '0';
    }
  }

  void initChangeFavorites({
    required String pokemonName,
    required String image,
    required int index,
  }) async {
    await changeFavorites(pokemonName, image);
    final pokemon =
        pokemonList.firstWhere((pokemon) => pokemon.name == pokemonName);
    final bool isFavorite = await validateFavorite(pokemonName);
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
