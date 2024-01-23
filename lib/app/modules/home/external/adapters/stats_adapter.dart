import 'dart:convert';

import 'package:pokedex_flutter/app/modules/home/domain/entity/pokemon_detail_home.dart';

class StatsAdapter {
  static Future<Map<String, dynamic>> toMap(Stats entity) async {
    return {
      'baseStats': entity.baseStats,
      'effort': entity.effort,
      'stat': entity.stat,
    };
  }

  static Stats fromMap(Map<String, dynamic> map) {
    return Stats(
      baseStats: map['base_stat'],
      effort: map['effort'],
      stat: Stat(
        name: map['stat']['name'],
        url: map['stat']['url'],
      ),
    );
  }

  static String toJson(Stats entity) => json.encode(toMap(entity));

  static Future<Stats> fromJSON(String source) async =>
      fromMap(jsonDecode(source));
}
