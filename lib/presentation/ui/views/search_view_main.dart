import 'package:flutter/material.dart';
import 'package:search/views/search_view.dart';

class SerachViewMain extends StatelessWidget {
  
  final String pokemonName;

  const SerachViewMain({
    super.key,
    required this.pokemonName
  });

  @override
  Widget build(BuildContext context) {
    return SearchView(pokemonName: pokemonName);
  }
}