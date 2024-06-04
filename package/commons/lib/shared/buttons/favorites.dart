import 'package:flutter/material.dart';
import 'package:fl_core_pokemon/domain/entities/pokemon/pokemon_detail_entity.dart';

class IconFavorites extends StatelessWidget {
  final PokemonDetailEntity pokemon;
  final Function(bool) isAddedToFavorites;
  final bool isFavorite;

  const IconFavorites({
    super.key,
    required this.pokemon,
    required this.isAddedToFavorites,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        isAddedToFavorites(!isFavorite);
      },
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
    );
  }
}
