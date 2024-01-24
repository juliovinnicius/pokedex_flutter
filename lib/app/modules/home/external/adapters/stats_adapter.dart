import 'dart:convert';

import 'package:pokedex_flutter/app/modules/home/domain/entity/pokemon_detail_home.dart';
import 'package:pokedex_flutter/app/modules/home/external/adapters/stat_adapter.dart';

class StatsAdapter {
  static Map<String, dynamic> toMap(Stats entity) {
    return {
      'baseStats': entity.baseStats,
      'effort': entity.effort,
      'stat': StatAdapter.toMap(entity.stat),
    };
  }

  static Stats fromMap(Map<String, dynamic> map) {
    return Stats(
      baseStats: map['base_stat'] ?? map['baseStats'],
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
