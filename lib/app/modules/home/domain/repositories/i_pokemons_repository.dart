import 'package:pokedex_flutter/app/modules/home/domain/dto/get_species_pokemon_dto.dart';
import 'package:pokedex_flutter/app/modules/home/domain/entity/pokemon_species.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../dto/get_all_pokemons_dto.dart';
import '../dto/get_pokemon_detail_home.dart';
import '../entity/pokemon.dart';
import '../entity/pokemon_detail_home.dart';

abstract class IPokemonsRepository {
  AsyncResult<List<Pokemon>, AppException> getPokemons(GetAllPokemonsDTO dto);

  AsyncResult<List<PokemonDetailHome>, AppException> getDetailPokemonHome(
    GetPokemonDetailHomeDTO dto,
  );

  AsyncResult<PokemonSpecies, AppException> getPokemonSpecies(
    GetSpeciesPokemonDTO dto,
  );
}
