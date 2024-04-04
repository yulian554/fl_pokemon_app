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

Page<dynamic> pageNotFound() {
  return CustomTransitionPage(
    child: const View404(),
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}
