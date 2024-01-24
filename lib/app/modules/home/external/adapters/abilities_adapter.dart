import 'dart:convert';

import 'package:pokedex_flutter/app/modules/home/domain/entity/pokemon_detail_home.dart';
import 'package:pokedex_flutter/app/modules/home/external/adapters/ability_adapter.dart';

class AbilitiesAdapter {
  static Map<String, dynamic> toMap(Abilities entity) {
    return {
      'isHidden': entity.isHidden,
      'slot': entity.slot,
      'ability': AbilityAdapter.toMap(entity.ability),
    };
  }

  static Abilities fromMap(Map<String, dynamic> map) {
    return Abilities(
      isHidden: map['is_hidden'],
      slot: map['slot'],
      ability: Ability(
        name: map['ability']['name'],
        url: map['ability']['url'],
      ),
    );
  }

  static String toJson(Abilities entity) => json.encode(toMap(entity));

  static Future<Abilities> fromJSON(String source) async =>
      fromMap(jsonDecode(source));
}
