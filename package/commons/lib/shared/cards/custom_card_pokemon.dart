import 'package:flutter/material.dart';
import 'package:commons/shared/buttons/favorites.dart';
import 'package:fl_core_pokemon/domain/entities/pokemon/pokemon_detail_entity.dart';

class CustomCartPokemon extends StatelessWidget {
  final PokemonDetailEntity pokemon;
  final Function(bool) isAddedToFavorites;

  const CustomCartPokemon({
    super.key,
    required this.pokemon,
    required this.isAddedToFavorites,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            side: BorderSide(color: Colors.white),
          ),
          child: SizedBox(
            height: 200,
            width: 200,
            child: Column(
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.network(
                      pokemon.sprites.frontDefault,
                      height: 140,
                      width: 140,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          height: 130,
                          width: 130,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                      child: Text(
                        pokemon.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 6,
          right: 5,
          child: IconFavorites(
            pokemon: pokemon,
            isAddedToFavorites: (i) => {isAddedToFavorites(i)},
            isFavorite: pokemon.isFavorite,
          ),
        ),
      ],
    );
  }
}
