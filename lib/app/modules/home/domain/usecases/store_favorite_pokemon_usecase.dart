import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../dto/favorite_pokemon_dto.dart';
import '../entity/pokemon_detail_home.dart';
import '../repositories/i_pokemons_repository.dart';

abstract class IStoreFavoritePokemonUseCase {
  AsyncResult<PokemonDetailHome, AppException> call(FavoritePokemonDTO dto);
}

class StoreFavoritePokemonUseCase implements IStoreFavoritePokemonUseCase {
  final IPokemonsRepository _repository;

  const StoreFavoritePokemonUseCase(this._repository);

  @override
  AsyncResult<PokemonDetailHome, AppException> call(
      FavoritePokemonDTO dto) async {
    return _repository.storePokemon(dto);
  }
}
