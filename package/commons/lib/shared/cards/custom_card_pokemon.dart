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
          Expanded(
            child: FittedBox(
              child: Image.network(
                pokemon.sprites.frontDefault,
                height: 100,
                width: 100,
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
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
    );
  }
}
