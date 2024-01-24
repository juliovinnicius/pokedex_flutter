import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../../domain/dto/favorite_pokemon_dto.dart';
import '../../domain/dto/get_all_pokemons_dto.dart';
import '../../domain/dto/get_pokemon_detail_home.dart';
import '../../domain/dto/get_species_pokemon_dto.dart';
import '../../domain/entity/pokemon.dart';
import '../../domain/entity/pokemon_detail_home.dart';
import '../../domain/entity/pokemon_species.dart';
import '../../domain/exceptions/home_exceptions.dart';
import '../../domain/repositories/i_pokemons_repository.dart';
import '../datasources/i_pokemon_local_datasource.dart';
import '../datasources/i_pokemons_datasource.dart';

class PokemonRepository implements IPokemonsRepository {
  final IPokemonsDataSource _dataSource;
  final IPokemonLocalDataSource _localDataSource;

  const PokemonRepository(
    this._dataSource,
    this._localDataSource,
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

  @override
  AsyncResult<PokemonSpecies, AppException> getPokemonSpecies(
    GetSpeciesPokemonDTO dto,
  ) async {
    try {
      final pokemonSpecies = await _dataSource.getPokemonSpecies(dto.idPokemon);
      return Success(pokemonSpecies);
    } on AppException catch (exception) {
      return Failure(exception);
    } catch (exception) {
      return Failure(
        UnableToGetPokemonSpeciesException(
          description: '$exception',
          error: exception,
        ),
      );
    }
  }

  @override
  AsyncResult<PokemonDetailHome, AppException> storePokemon(
      FavoritePokemonDTO dto) async {
    try {
      final pokemon = await _localDataSource.storeFavoritePokemon(
        pokemon: dto.pokemon,
      );
      return Success(pokemon);
    } on AppException catch (exception) {
      return Failure(exception);
    } catch (exception) {
      return Failure(
        UnableToStoreFavoritePokemonException(
          description: '$exception',
          error: exception,
        ),
      );
    }
  }

  @override
  AsyncResult<List<PokemonDetailHome>, AppException>
      getPokemonDetailFavorite() async {
    try {
      final listPokemons = await _localDataSource.getFavoritePokemon();
      return Success(listPokemons);
    } on AppException catch (exception) {
      return Failure(exception);
    } catch (exception) {
      return Failure(
        UnableToGetPokemonDetailFromLocalStorageException(
          description: '$exception',
          error: exception,
        ),
      );
    }
  }

  @override
  AsyncResult<PokemonDetailHome, AppException> removePokemon(
      FavoritePokemonDTO dto) async {
    try {
      final pokemon =
          await _localDataSource.removeFavoritePokemon(pokemon: dto.pokemon);
      return Success(pokemon);
    } on AppException catch (exception) {
      return Failure(exception);
    } catch (exception) {
      return Failure(
        UnableToRemoveFavoritePokemonFromLocalStorageException(
          description: '$exception',
          error: exception,
        ),
      );
    }
  }
}
