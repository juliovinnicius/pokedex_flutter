import 'dart:convert';

import 'package:pokedex_flutter/app/modules/home/domain/entity/pokemon_detail_home.dart';
import 'package:pokedex_flutter/app/modules/home/external/adapters/types_adapter.dart';

class PokemonDetailHomeAdapter {
  static Map<String, dynamic> toMap(PokemonDetailHome entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'image': entity.image,
      'type': entity.types,
    };
  }

  static PokemonDetailHome fromMap(Map<String, dynamic> map) {
    return PokemonDetailHome(
      id: map['id'],
      name: map['name'],
      image: map['sprites']['other']['official-artwork']['front_default'],
      types: List<Types>.from(
        map['types'].map(
          (type) => TypesAdapter.fromMap(
            type,
          ),
        ),
      ),
    );
  }

  static String toJson(PokemonDetailHome entity) => json.encode(toMap(entity));

  static PokemonDetailHome fromJSON(String source) =>
      fromMap(jsonDecode(source));
}
