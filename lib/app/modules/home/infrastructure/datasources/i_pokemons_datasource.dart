import 'package:pokedex_flutter/app/modules/home/domain/entity/pokemon_detail_home.dart';
import 'package:pokedex_flutter/app/modules/home/domain/entity/pokemon_species.dart';

import '../../domain/entity/pokemon.dart';

abstract class IPokemonsDataSource {
  Future<List<Pokemon>> getPokemons(int? offset);

  Future<List<PokemonDetailHome>> getPokemonDetailHome(List<String> listName);

  Future<PokemonSpecies> getPokemonSpecies(int id);
}
