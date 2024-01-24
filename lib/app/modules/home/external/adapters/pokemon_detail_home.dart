import 'dart:convert';

import '../../domain/entity/pokemon_detail_home.dart';
import 'abilities_adapter.dart';
import 'stats_adapter.dart';
import 'types_adapter.dart';

class PokemonDetailHomeAdapter {
  static Map<String, dynamic> toMap(PokemonDetailHome entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'image': entity.image,
      'type': entity.types,
      'height': entity.height,
      'weight': entity.weight,
      'stats': entity.stats,
      'abilities': entity.abilities,
    };
  }

  static PokemonDetailHome fromMap(Map<String, dynamic> map) {
    return PokemonDetailHome(
      id: map['id'],
      name: map['name'],
      image: map['sprites']['other']['official-artwork']['front_default'],
      types: List<Types>.from(
        map['types'].map(
          (type) => TypesAdapter.fromMap(
            type,
          ),
        ),
      ),
      height: map['height'],
      weight: map['weight'],
      stats: List<Stats>.from(
        map['stats'].map(
          (stat) => StatsAdapter.fromMap(
            stat,
          ),
        ),
      ),
      abilities: List<Abilities>.from(
        map['abilities'].map(
          (ability) => AbilitiesAdapter.fromMap(
            ability,
          ),
        ),
      ),
    );
  }

  static String toJson(PokemonDetailHome entity) => json.encode(toMap(entity));

  static PokemonDetailHome fromJSON(String source) =>
      fromMap(jsonDecode(source));
}
