import '../../domain/entity/pokemon_detail_home.dart';

abstract class IPokemonLocalDataSource {
  Future<PokemonDetailHome> storeFavoritePokemon({
    required PokemonDetailHome pokemon,
  });

  // Future<List<Pokemon>> getFavoritePokemon();

  // Future<void> removeFavoritePokemon({required Pokemon pokemon});
}
