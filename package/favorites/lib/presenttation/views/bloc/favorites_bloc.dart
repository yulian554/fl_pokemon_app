import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:commons/helper/mixin/favorites_mixin.dart';
import 'package:favorites/presenttation/views/bloc/favorites_event.dart';
import 'package:favorites/presenttation/views/bloc/favorites_state.dart';
import 'package:fl_core_pokemon/domain/entities/pokemon/pokemon_detail_entity.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState>
    with FavoritesMixin {
  FavoritesBloc() : super(FavoritesStarted()) {
    on<GetFavoritesInitial>(_onGetFavoritesInitial);
    on<ChangeFavorites>(_onChangeFavorites);
  }

  void _onGetFavoritesInitial(
      GetFavoritesInitial event, Emitter<FavoritesState> emit) async {
    final data = await getFavoritesPokemons();
    final list = data.map((item) {
      return PokemonDetailEntity(
          name: item.name, sprites: item.sprites, isFavorite: true);
    }).toList();
    final state = SuccessFavorites(pokemons: list);
    emit(state);
  }

  void _onChangeFavorites(
    ChangeFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    final list = event.pokemons;
    await changeFavorites(event.pokemonName, event.image);
    list.remove(list[event.index]);
    final state = SuccessFavorites(pokemons: list);
    emit(state);
  }
}
