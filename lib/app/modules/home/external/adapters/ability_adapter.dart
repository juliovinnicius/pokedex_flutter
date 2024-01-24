import 'dart:convert';

import 'package:pokedex_flutter/app/modules/home/domain/entity/pokemon_detail_home.dart';

class AbilityAdapter {
  static Map<String, dynamic> toMap(Ability entity) {
    return {
      'name': entity.name,
      'url': entity.url,
    };
  }

  static Ability fromMap(Map<String, dynamic> map) {
    return Ability(
      name: map['name'],
      url: map['url'],
    );
  }

  static String toJson(Ability entity) => json.encode(toMap(entity));

  static Future<Ability> fromJSON(String source) async =>
      fromMap(jsonDecode(source));
}
