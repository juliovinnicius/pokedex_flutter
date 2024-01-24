import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/dto/get_species_pokemon_dto.dart';
import '../../domain/entity/pokemon_detail_home.dart';
import '../../domain/entity/pokemon_species.dart';
import '../../domain/usecases/get_species_pokemon_usecase.dart';

part 'species_state.dart';

class SpeciesCubit extends Cubit<SpeciesState> {
  final IGetSpeciesPokemonUseCase getSpeciesPokemonUseCase;

  SpeciesCubit({
    required this.getSpeciesPokemonUseCase,
  }) : super(SpeciesInitial());

  Future<void> getSpecies(PokemonDetailHome pokemon) async {
    final dto = GetSpeciesPokemonDTO(idPokemon: pokemon.id);
    final result = await getSpeciesPokemonUseCase(dto);

    result.fold(
      (success) {
        emit(LoadedPokemonSpeciesState(pokemonSpecies: success));
      },
      (failure) {
        return emit(ErrorSpeciesState());
      },
    );
  }
}
