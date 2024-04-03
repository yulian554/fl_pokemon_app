import 'package:flutter/material.dart';
import 'package:commons/domain/entities/pokemon/pokemon_detail_entity.dart';
import 'package:search/use_cases/get_pokemon_by_name/get_pokemon_by_name.dart';
import 'package:search/use_cases/get_pokemon_by_name/get_pokemon_by_name_impl.dart';

class SearchPresenter extends ChangeNotifier {
  String error = '';
  bool isLoading = false;
  PokemonDetailEntity? pokemon;
  GetPokemonByNameUseCase? getPokemonByNameUseCase;

  SearchPresenter({this.getPokemonByNameUseCase}) {
    getPokemonByNameUseCase = GetPokemonByNameUseCaseImpl();
  }

  Future<void> getPokemon(String name) async {
    isLoading = true;
    notifyListeners();
    final result = await getPokemonByNameUseCase?.invoke(name);
    error = result?.$2 ?? '';
    pokemon = result?.$1;
    isLoading = false;
    notifyListeners();
  }
}
