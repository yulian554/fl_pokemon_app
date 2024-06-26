import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:lobby/presenters/home_presenter.dart';
import 'package:commons/shared/cards/custom_card_pokemon.dart';

class HomeView extends StatelessWidget {
  final String limit;
  final String offset;

  const HomeView({
    super.key, 
    required this.limit, 
    required this.offset
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePresenter()..loadPageSpecific(limit, offset),
      lazy: false,
      child: const _ViewGridHome(),
    );
  }
}

class _ViewGridHome extends StatelessWidget {
  const _ViewGridHome();

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<HomePresenter>();

    return (presenter.pokemonList.isEmpty)
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Stack(children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: (kIsWeb) ? 720 : 20.0, vertical: 20),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(presenter.pokemonList.length, (index) {
                  return CustomCartPokemon(
                      pokemon: presenter.pokemonList[index]);
                }),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 30,
              child: FloatingActionButton(
                child: (presenter.isLoading) ? const CircularProgressIndicator() : const Icon(Icons.offline_bolt),
                onPressed: () {
                  if (!presenter.isLoading) {
                    presenter.loadPageDefault(); 
                  }
                }
              ),
            )
          ]
        );
  }
}
