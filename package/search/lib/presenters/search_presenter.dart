import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:commons/helper/mixin/favorites_mixin.dart';
import 'package:search/use_cases/get_pokemon_by_name/get_pokemon_by_name.dart';
import 'package:fl_core_pokemon/domain/entities/pokemon/pokemon_detail_entity.dart';
import 'package:search/use_cases/get_pokemon_by_name/get_pokemon_by_name_impl.dart';

class SearchPresenter extends ChangeNotifier with FavoritesMixin {
  String error = '';
  bool isLoading = false;
  PokemonDetailEntity? pokemon;
  GetPokemonByNameUseCase? getPokemonByNameUseCase;

  SearchPresenter({this.getPokemonByNameUseCase}) {
    getPokemonByNameUseCase = GetPokemonByNameUseCaseImpl();
  }

  Future<void> getPokemon(String name, bool updateUrl) async {
    if (name.isNotEmpty && updateUrl) {
      html.window.history.pushState(null, 'none', '#/search/$name');
    }
    isLoading = true;
    notifyListeners();
    final result = await getPokemonByNameUseCase?.invoke(name);
    error = result?.$2 ?? '';
    pokemon = result?.$1;
    isLoading = false;
    notifyListeners();
  }

  void onChangeFavorites() async {
    if (pokemon == null) return;
    await changeFavorites(pokemon!);
    final bool isFavorite = await validateFavorite(pokemon!.name);
    pokemon = PokemonDetailEntity(
      name: pokemon!.name,
      sprites: pokemon!.sprites,
      isFavorite: isFavorite,
    );
    notifyListeners();
  }
}
