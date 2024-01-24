import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:pokedex_flutter/app/modules/home/external/adapters/type_adapter.dart';

import '../../domain/entity/pokemon_detail_home.dart';

class TypesAdapter {
  // static List<Map<String, dynamic>> toMapAsAuxiliaryReading(
  //   List<Product> auxiliaryReading,
  // ) {
  //   final auxiliaryReadingAsMap = groupBy(auxiliaryReading, (e) => e.id);

  //   return auxiliaryReadingAsMap.entries
  //       .map(
  //         (entry) => {
  //           'productId': entry.key,
  //           'quantity': entry.value.length,
  //         },
  //       )
  //       .toList();
  // }
  static Map<String, dynamic> toMap(Types entity) {
    return {
      'slot': entity.slot,
      'type': TypePokemonAdapter.toMap(entity.type!),
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
