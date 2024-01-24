import 'dart:convert';

import '../../domain/entity/pokemon_species.dart';
import 'flavor_text_entries_adapter.dart';

class SpeciesAdapter {
  static Map<String, dynamic> toMap(PokemonSpecies entity) {
    return {
      'id': entity.id,
      'genderRate': entity.genderRate,
      'flavorTextEntries': entity.flavorTextEntries,
    };
  }

  static PokemonSpecies fromMap(Map<String, dynamic> map) {
    return PokemonSpecies(
      id: map['id'],
      genderRate: map['gender_rate'],
      flavorTextEntries: List<FlavorTextEntries>.from(
        map['flavor_text_entries'].map(
          (flavor) => FlavorTextEntriesAdapter.fromMap(
            flavor,
          ),
        ),
      ),
    );
  }

  static String toJson(PokemonSpecies entity) => json.encode(toMap(entity));

  static PokemonSpecies fromJSON(String source) => fromMap(jsonDecode(source));
}
