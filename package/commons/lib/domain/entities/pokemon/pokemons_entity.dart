class PokemonsEntity  {
    int count;
    String next;
    String previous;
    List<InitialDataPokemonEntity> results;

    PokemonsEntity({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });
}

class InitialDataPokemonEntity {
  String name;
  String url;

  InitialDataPokemonEntity({
    required this.name,
    required this.url,
  });
}