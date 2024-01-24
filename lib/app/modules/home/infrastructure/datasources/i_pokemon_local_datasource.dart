import '../../domain/entity/pokemon_detail_home.dart';

abstract class IPokemonLocalDataSource {
  Future<PokemonDetailHome> storeFavoritePokemon({
    required PokemonDetailHome pokemon,
  });

  Future<List<PokemonDetailHome>> getFavoritePokemon();

  Future<PokemonDetailHome> removeFavoritePokemon(
      {required PokemonDetailHome pokemon});
}
