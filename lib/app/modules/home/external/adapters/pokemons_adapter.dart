import 'dart:convert';

import '../../domain/entity/pokemon.dart';

class PokemonAdapter {
  static Map<String, dynamic> toMap(Pokemon entity) {
    return {
      'name': entity.name,
      'url': entity.url,
    };
  }

  static Pokemon fromMap(Map<String, dynamic> map) {
    return Pokemon(
      name: map['name'],
      url: map['url'],
    );
  }

  static String toJson(Pokemon entity) => json.encode(toMap(entity));

  static Pokemon fromJSON(String source) => fromMap(jsonDecode(source));
}
