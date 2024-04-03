import 'package:commons/domain/entities/pokemon/pokemon_detail_entity.dart';

class PokemonDetailModel {
    String name;
    SpritesModel sprites;

    PokemonDetailModel({
        required this.name,
        required this.sprites,
    });

    factory PokemonDetailModel.fromJson(Map<String, dynamic> json) => PokemonDetailModel(
        name: json["name"] ?? '',
        sprites: SpritesModel.fromJson(json["sprites"]),
    );

      PokemonDetailEntity toPokemonDetailEntity() => PokemonDetailEntity(
        name: name, 
        sprites: sprites.toSpritesEntity()
      );
}

class SpritesModel {
    String frontDefault;

    SpritesModel({
        required this.frontDefault,
    });

    factory SpritesModel.fromJson(Map<String, dynamic> json) => SpritesModel(
        frontDefault: json["front_default"],
    );

  SpritesEntity toSpritesEntity() => SpritesEntity(
    frontDefault: frontDefault
  );
}
