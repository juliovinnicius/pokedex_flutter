import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../dto/get_all_pokemons_dto.dart';
import '../entity/pokemon.dart';
import '../repositories/i_pokemons_repository.dart';

abstract class IGetAllPokemonsUseCase {
  AsyncResult<List<Pokemon>, AppException> call(GetAllPokemonsDTO dto);
}

class GetAllPokemonsUseCase implements IGetAllPokemonsUseCase {
  final IPokemonsRepository _repository;

  const GetAllPokemonsUseCase(this._repository);

  @override
  AsyncResult<List<Pokemon>, AppException> call(GetAllPokemonsDTO dto) async {
    return dto.validate().toAsyncResult().flatMap(_repository.getPokemons);
  }
}
