import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:commons/shared/cards/custom_card_pokemon.dart';
import 'package:favorites/presenttation/views/bloc/favorites_bloc.dart';
import 'package:favorites/presenttation/views/bloc/favorites_event.dart';
import 'package:favorites/presenttation/views/bloc/favorites_state.dart';
import 'package:fl_core_pokemon/domain/entities/pokemon/pokemon_detail_entity.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoritesBloc(),
      child: const _BodyFavorites(),
    );
  }
}

class _BodyFavorites extends StatelessWidget {
  const _BodyFavorites();

  @override
  Widget build(BuildContext context) {
    final FavoritesBloc bloc = context.read()..add(GetFavoritesInitial());

    return BlocBuilder<FavoritesBloc, FavoritesState>(
        bloc: bloc,
        builder: (context, state) {
          List<PokemonDetailEntity> pokemons = [];
          if (state is SuccessFavorites) {
            pokemons = state.pokemons;
          }
          return Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: (kIsWeb) ? getWidthForGrid() : double.infinity,
                    child: pokemons.isEmpty
                        ? Text('You hasn´t Pokemons')
                        : GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            children: List.generate(pokemons.length, (index) {
                              final pokemon = pokemons[index];
                              return CustomCartPokemon(
                                pokemon: pokemon,
                                isAddedToFavorites: (_) {
                                  bloc.add(
                                    ChangeFavorites(
                                      pokemons: pokemons,
                                      pokemonName: pokemon.name,
                                      image: pokemon.sprites.frontDefault,
                                      index: index,
                                    ),
                                  );
                                },
                              );
                            }),
                          ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  double getWidthForGrid() {
    return 400;
  }
}
