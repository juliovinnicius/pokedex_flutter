import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../dto/get_pokemon_detail_home.dart';
import '../entity/pokemon_detail_home.dart';
import '../repositories/i_pokemons_repository.dart';

abstract class IGetPokemonDetailsUseCase {
  AsyncResult<List<PokemonDetailHome>, AppException> call(
      GetPokemonDetailHomeDTO dto);
}

class GetPokemonDetailsUseCase implements IGetPokemonDetailsUseCase {
  final IPokemonsRepository _repository;

  const GetPokemonDetailsUseCase(this._repository);

  @override
  AsyncResult<List<PokemonDetailHome>, AppException> call(
      GetPokemonDetailHomeDTO dto) async {
    return _repository.getDetailPokemonHome(dto);
  }
}
