import 'package:pokedex_flutter/app/modules/home/domain/dto/get_all_pokemons_dto.dart';
import 'package:pokedex_flutter/app/modules/home/domain/dto/get_pokemon_detail_home.dart';
import 'package:pokedex_flutter/app/modules/home/domain/entity/pokemon_detail_home.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../../domain/entity/pokemon.dart';
import '../../domain/exceptions/home_exceptions.dart';
import '../../domain/repositories/i_pokemons_repository.dart';
import '../datasources/i_pokemons_datasource.dart';

class PokemonRepository implements IPokemonsRepository {
  final IPokemonsDataSource _dataSource;

  const PokemonRepository(
    this._dataSource,
  );

  @override
  AsyncResult<List<Pokemon>, AppException> getPokemons(
    GetAllPokemonsDTO dto,
  ) async {
    try {
      final pokemons = await _dataSource.getPokemons(dto.offset);
      return Success(pokemons);
    } on AppException catch (exception) {
      return Failure(exception);
    } catch (exception) {
      return Failure(
        UnableToGetAllPokemonsException(
          description: '$exception',
          error: exception,
        ),
      );
    }
  }

  @override
  AsyncResult<List<PokemonDetailHome>, AppException> getDetailPokemonHome(
    GetPokemonDetailHomeDTO dto,
  ) async {
    try {
      final pokemonDetail =
          await _dataSource.getPokemonDetailHome(dto.listName);
      return Success(pokemonDetail);
    } on AppException catch (exception) {
      return Failure(exception);
    } catch (exception) {
      return Failure(
        UnableToGetPokemonDetailException(
          description: '$exception',
          error: exception,
        ),
      );
    }
  }
}
