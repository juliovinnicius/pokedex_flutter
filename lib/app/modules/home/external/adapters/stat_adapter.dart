import 'dart:convert';

import '../../domain/entity/pokemon_detail_home.dart';

class StatAdapter {
  static Map<String, dynamic> toMap(Stat entity) {
    return {
      'name': entity.name,
      'url': entity.url,
    };
  }

  static Stat fromMap(Map<String, dynamic> map) {
    return Stat(
      name: map['name'],
      url: map['url'],
    );
  }

  static String toJson(Stat entity) => json.encode(toMap(entity));

  static Future<Stat> fromJSON(String source) async =>
      fromMap(jsonDecode(source));
}
