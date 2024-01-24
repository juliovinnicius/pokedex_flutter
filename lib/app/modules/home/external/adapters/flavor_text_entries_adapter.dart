import 'dart:convert';

import '../../domain/entity/pokemon_species.dart';

class FlavorTextEntriesAdapter {
  static Future<Map<String, dynamic>> toMap(FlavorTextEntries entity) async {
    return {
      'flavorText': entity.flavorText,
    };
  }

  static FlavorTextEntries fromMap(Map<String, dynamic> map) {
    return FlavorTextEntries(flavorText: map['flavor_text']);
  }

  static String toJson(FlavorTextEntries entity) => json.encode(toMap(entity));

  static Future<FlavorTextEntries> fromJSON(String source) async =>
      fromMap(jsonDecode(source));
}
