import 'package:fluro/fluro.dart';
import 'package:commons/shared/views/view_404.dart';
import 'package:app_pokenmon/presentation/ui/views/home_view_main.dart';
import 'package:app_pokenmon/presentation/ui/views/search_view_main.dart';
import 'package:app_pokenmon/presentation/ui/views/profile_view_main.dart';
import 'package:app_pokenmon/presentation/ui/views/favorites_view_main.dart';

final homeView = Handler(handlerFunc: (_, parameters) {
  final limit = parameters['limit']?.first ?? '10';
  final offset = parameters['offset']?.first ?? '0';
  return HomeViewMain(limit: limit, offset: offset);
});

final searchView = Handler(handlerFunc: (_, parameters) {
  final name = parameters['name']?.first ?? '';
  return SerachViewMain(pokemonName: name);
});

final favoritesView =
    Handler(handlerFunc: (_, __) => const FavoritesViewMain());

final profileView = Handler(handlerFunc: (_, __) => const ProfileViewMain());

final pageNotFound = Handler(handlerFunc: (_, __) => const View404());
