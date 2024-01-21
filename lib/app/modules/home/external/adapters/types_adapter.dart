import 'dart:convert';

import 'package:pokedex_flutter/app/modules/home/domain/entity/pokemon_detail_home.dart';

class TypesAdapter {
  static Future<Map<String, dynamic>> toMap(Types entity) async {
    return {
      'slot': entity.slot,
      'type': entity.type,
    };
  }

  static Types fromMap(Map<String, dynamic> map) {
    return Types(
      slot: map['slot'],
      type: Type(
        name: map['type']['name'],
        url: map['type']['url'],
      ),
    );
  }

  static String toJson(Types entity) => json.encode(toMap(entity));

  static Future<Types> fromJSON(String source) async =>
      fromMap(jsonDecode(source));
}
