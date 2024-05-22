import 'package:commons/domain/entities/pokemon/pokemons_entity.dart';

class PokemonsModel {
  int count;
  String next;
  String previous;
  List<InitialDataPokemonModel> results;

  PokemonsModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonsModel.fromJson(Map<String, dynamic> json) => PokemonsModel(
        count: json['count'] ?? 0,
        next: json['next'] ?? '',
        previous: json['previous'] ?? '',
        results: List<InitialDataPokemonModel>.from(json["results"]
            .map((item) => InitialDataPokemonModel.fromJson(item))),
      );

  PokemonsEntity toPokemonsEntity() => PokemonsEntity(
      count: count,
      next: next,
      previous: previous,
      results: results
          .map((item) =>
              InitialDataPokemonEntity(name: item.name, url: item.url))
          .toList());
}

class InitialDataPokemonModel {
  String name;
  String url;

  InitialDataPokemonModel({
    required this.name,
    required this.url,
  });

  factory InitialDataPokemonModel.fromJson(Map<String, dynamic> json) =>
      InitialDataPokemonModel(
        name: json["name"],
        url: json["url"],
      );
}
