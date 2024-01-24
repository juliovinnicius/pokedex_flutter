import 'package:pokedex_flutter/app/modules/home/external/adapters/pokemon_detail_home.dart';

import '../../../../core/packages/local_storage_service/abstractions/i_local_storage_service.dart';
import '../../domain/entity/pokemon_detail_home.dart';
import '../../infrastructure/datasources/i_pokemon_local_datasource.dart';

class PokemonLocalDataSource implements IPokemonLocalDataSource {
  final ILocalStorageService _localStorageService;

  const PokemonLocalDataSource(this._localStorageService);

  @override
  Future<PokemonDetailHome> storeFavoritePokemon(
      {required PokemonDetailHome pokemon}) async {
    final containsPokemons = await _localStorageService.contains(
      key: 'FAVORITE',
    );

    final mapOfPokemons = <String, dynamic>{};

    if (containsPokemons) {
      final existingOffers = await _localStorageService.get(
        key: 'FAVORITE',
      );

      mapOfPokemons.addAll(existingOffers);
    }

    mapOfPokemons[pokemon.name] = await PokemonDetailHomeAdapter.toMap(pokemon);

    await _localStorageService.store(
      value: mapOfPokemons,
      key: 'FAVORITE',
    );

    return pokemon;
  }
}
