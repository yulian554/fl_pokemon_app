import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:search/presenters/search_presenter.dart';
import 'package:commons/shared/cards/custom_card_pokemon.dart';
import 'package:commons/shared/search_bar/custom_search_bar.dart';
import 'package:fl_core_pokemon/domain/entities/pokemon/pokemon_detail_entity.dart';

class SearchView extends StatelessWidget {
  final String pokemonName;

  const SearchView({super.key, required this.pokemonName});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchPresenter()..getPokemon(pokemonName, false),
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

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: (kIsWeb) ? getWidthForGrid() : double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 5),
            CustomSearchBar(
                widthOfSerach: 500,
                onValue: (value) {
                  if (presenter.isLoading) return;
                  presenter.getPokemon(value, true);
                }),
            const Spacer(),
            if (!presenter.isLoading)
              (presenter.pokemon == null)
                  ? Text(presenter.error.isEmpty
                      ? 'Empty pokémon'
                      : presenter.error)
                  : _ViewPokemon(pokemon: presenter.pokemon!),
            if (presenter.isLoading) ...[
              const Center(
                child: CircularProgressIndicator(),
              )
            ],
            const Spacer(),
          ],
        ),
      ),
    );
  }

  double getWidthForGrid() {
    return 400;
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
          isAddedToFavorites: (i) {},
        ));
  }
}
