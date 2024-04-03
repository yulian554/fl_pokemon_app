class PokemonDetailEntity {
    String name;
    SpritesEntity sprites;

    PokemonDetailEntity({
        required this.name,
        required this.sprites,
    });
}

class SpritesEntity {
    String frontDefault;

    SpritesEntity({
        required this.frontDefault,
    });
}