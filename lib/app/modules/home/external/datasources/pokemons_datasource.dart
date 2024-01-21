import 'dart:convert';

import 'package:pokedex_flutter/app/core/configurations/routes/app_api_routes.dart';
import 'package:pokedex_flutter/app/modules/home/domain/entity/pokemon.dart';
import 'package:pokedex_flutter/app/modules/home/domain/entity/pokemon_detail_home.dart';
import 'package:pokedex_flutter/app/modules/home/domain/exceptions/home_exceptions.dart';
import 'package:pokedex_flutter/app/modules/home/external/adapters/pokemon_detail_home.dart';
import 'package:pokedex_flutter/app/modules/home/external/adapters/pokemons_adapter.dart';
import 'package:pokedex_flutter/app/modules/home/infrastructure/datasources/i_pokemons_datasource.dart';

import '../../../../core/exceptions/internal_server_exception.dart';
import '../../../../core/packages/abstractions/i_http_client.dart';

class PokemonsDataSource implements IPokemonsDataSource {
  final IHttpClient _httpClient;
  final AppApiRoutes _appApiRoutes;

  const PokemonsDataSource(this._httpClient, this._appApiRoutes);

  @override
  Future<List<Pokemon>> getPokemons(int? offset) async {
    final url = _appApiRoutes.getAllPokemons(
      offset: offset,
    );

    final response = await _httpClient.get(url);

    switch (response.statusCode) {
      case 200:
        final decodedResponse = json.decode(response.data);
        return List<Pokemon>.from(
          decodedResponse['results']?.map(
            (map) => PokemonAdapter.fromMap(map),
          ),
        );
      case 400:
        throw UnableToGetAllPokemonsException(
          description: 'Unable to get all pokemons',
        );
      default:
        throw InternalServerException(description: response.data);
    }
  }

  @override
  Future<List<PokemonDetailHome>> getPokemonDetailHome(
      List<String> listName) async {
    final listPokemons = <PokemonDetailHome>[];
    for (var name in listName) {
      final url = _appApiRoutes.getPokemonDetails(
        name,
      );

      final response = await _httpClient.get(url);

      switch (response.statusCode) {
        case 200:
          final decodedResponse = json.decode(response.data);
          listPokemons.add(PokemonDetailHomeAdapter.fromMap(decodedResponse));
        case 400:
          throw UnableToGetPokemonDetailException(
            description: 'Unable to get pokemon',
          );
        default:
          throw InternalServerException(description: response.data);
      }
    }
    return listPokemons;
  }
}
