import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:app_pokenmon/presentation/ui/views/views.dart';

Page<dynamic> pageHomeView(GoRouterState state) {
  final params = state.uri.queryParameters;
  final limit = params['limit'] ?? '10';
  final offset = params['offset'] ?? '0';
  return CustomTransitionPage(
    child: HomeViewMain(limit: limit, offset: offset),
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

Page<dynamic> pageSearchWithView(GoRouterState state) {
  final name = state.pathParameters['name'] ?? '';
  return CustomTransitionPage(
    child: SerachViewMain(pokemonName: name),
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

Page<dynamic> pageSearchView() {
  return CustomTransitionPage(
    child: const SerachViewMain(pokemonName: ''),
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

Page<dynamic> pageFavoritesView() {
  return CustomTransitionPage(
    child: const FavoritesViewMain(),
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

Page<dynamic> pageProfileView() {
  return CustomTransitionPage(
    child: const ProfileViewMain(),
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

Page<dynamic> pageConfigView() {
  return CustomTransitionPage(
    child: const ConfigViewMain(),
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

Page<dynamic> pageNotFound(GoRouterState goRouterState) {
  return CustomTransitionPage(
    child: Error404ViewMain(message: goRouterState.error.toString()),
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}
