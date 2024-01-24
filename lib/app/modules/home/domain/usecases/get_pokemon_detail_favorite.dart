import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../entity/pokemon_detail_home.dart';
import '../repositories/i_pokemons_repository.dart';

abstract class IGetPokemonDetailsFavoriteUseCase {
  AsyncResult<List<PokemonDetailHome>, AppException> call();
}

class GetPokemonDetailsFavoriteUseCase
    implements IGetPokemonDetailsFavoriteUseCase {
  final IPokemonsRepository _repository;

  const GetPokemonDetailsFavoriteUseCase(this._repository);

  @override
  AsyncResult<List<PokemonDetailHome>, AppException> call() async {
    return _repository.getPokemonDetailFavorite();
  }
}
