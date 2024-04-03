import 'package:flutter/material.dart';
import 'package:lobby/use_cases/get_all_pokemons_use_case.dart';
import 'package:lobby/use_cases/get_all_pokemons_use_case_impl.dart';
import 'package:commons/domain/entities/pokemon/pokemon_detail_entity.dart';

class HomePresenter extends ChangeNotifier {
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
    final newPokemonList = await getAllPokemonsUseCase?.invoke(limit.toString(), offset.toString());
    isLoading = false;
    if (newPokemonList != null) pokemonList.addAll(newPokemonList);
    notifyListeners();
  }

  Future<void> loadPageSpecific(String limit, String offset) async {
    final mLimit = getLimit(limit);
    final mOffset = getOffset(offset);
    final newPokemonList = await getAllPokemonsUseCase?.invoke(mLimit, mOffset);
    isLoading = false;
    pokemonList.clear();
    if (newPokemonList != null) pokemonList.addAll(newPokemonList);
    notifyListeners();
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
  
}
