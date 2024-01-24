import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../dto/get_species_pokemon_dto.dart';
import '../entity/pokemon_species.dart';
import '../repositories/i_pokemons_repository.dart';

abstract class IGetSpeciesPokemonUseCase {
  AsyncResult<PokemonSpecies, AppException> call(
    GetSpeciesPokemonDTO dto,
  );
}

class GetSpeciesPokemonUseCase implements IGetSpeciesPokemonUseCase {
  final IPokemonsRepository _repository;

  const GetSpeciesPokemonUseCase(this._repository);

  @override
  AsyncResult<PokemonSpecies, AppException> call(
      GetSpeciesPokemonDTO dto) async {
    return _repository.getPokemonSpecies(dto);
  }
}
