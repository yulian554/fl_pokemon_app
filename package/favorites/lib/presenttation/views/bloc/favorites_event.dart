import 'package:fl_core_pokemon/domain/entities/pokemon/pokemon_detail_entity.dart';

sealed class FavoritesEvent {}

final class GetFavoritesInitial extends FavoritesEvent {}

final class ChangeFavorites extends FavoritesEvent {
  List<PokemonDetailEntity> pokemons;
  String pokemonName;
  String image;
  int index;

  ChangeFavorites({
    required this.pokemons,
    required this.pokemonName,
    required this.image,
    required this.index,
  });
}
