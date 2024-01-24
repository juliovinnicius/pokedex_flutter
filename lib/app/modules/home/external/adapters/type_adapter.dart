import 'dart:convert';

import '../../domain/entity/pokemon_detail_home.dart';

class TypePokemonAdapter {
  static Map<String, dynamic> toMap(Type entity) {
    return {
      'name': entity.name,
      'url': entity.url,
    };
  }

  static Type fromMap(Map<String, dynamic> map) {
    return Type(name: map['name'], url: map['url']);
  }

  static String toJson(Type entity) => json.encode(toMap(entity));

  static Future<Type> fromJSON(String source) async =>
      fromMap(jsonDecode(source));
}
