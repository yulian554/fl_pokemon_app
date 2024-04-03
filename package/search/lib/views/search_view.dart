import 'package:commons/domain/entities/pokemon/pokemon_detail_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:search/presenters/search_presenter.dart';
import 'package:commons/shared/cards/custom_card_pokemon.dart';
import 'package:commons/shared/search_bar/custom_search_bar.dart';

class SearchView extends StatelessWidget {
  final String pokemonName;

  const SearchView({super.key, required this.pokemonName});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchPresenter()..getPokemon(pokemonName),
      lazy: false,
      child: const _ViewGridSearch(),
    );
  }
}

class _ViewGridSearch extends StatelessWidget {
  const _ViewGridSearch();

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<SearchPresenter>();

    return ((!presenter.isLoading))
        ? Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: (kIsWeb) ? 720 : 20.0, vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 30),
                CustomSearchBar(onValue: (value) {
                  if (presenter.isLoading) return;
                  presenter.getPokemon(value);
                }),
                const Spacer(),
                (presenter.pokemon == null)
                    ? Text(presenter.error.isEmpty
                        ? 'Empty pokémon'
                        : presenter.error)
                    : _ViewPokemon(pokemon: presenter.pokemon!),
                const Spacer(),
              ],
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}

class _ViewPokemon extends StatelessWidget {
  const _ViewPokemon({
    required this.pokemon,
  });

  final PokemonDetailEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: 200,
        child: CustomCartPokemon(
          pokemon: pokemon,
        ));
  }
}
