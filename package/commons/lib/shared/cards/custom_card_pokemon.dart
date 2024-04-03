import 'package:flutter/material.dart';
import 'package:commons/domain/entities/pokemon/pokemon_detail_entity.dart';

class CustomCartPokemon extends StatelessWidget {
  const CustomCartPokemon({super.key, required this.pokemon});

  final PokemonDetailEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      side: BorderSide(color: Colors.white),
    ),
      child: Column(
        children: [
          Image.network(
            pokemon.sprites.frontDefault,
            height: 130,
            width: 130,
            fit: BoxFit.cover,
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
          Text(
            pokemon.name,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
