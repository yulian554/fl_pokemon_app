import 'package:fl_core_pokemon/domain/entities/pokemon/pokemon_detail_entity.dart';

sealed class FavoritesState {}

final class FavoritesStarted extends FavoritesState {}

final class LoadingFavorites extends FavoritesState {}

final class SuccessFavorites extends FavoritesState {
  List<PokemonDetailEntity> pokemons;

  SuccessFavorites({required this.pokemons});
}

final class FailureFavorites extends FavoritesState {
  Exception error;
  FailureFavorites({required this.error});
}
