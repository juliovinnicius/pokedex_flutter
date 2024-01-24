import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/dto/get_all_pokemons_dto.dart';
import '../../domain/dto/get_pokemon_detail_home.dart';
import '../../domain/entity/pokemon.dart';
import '../../domain/entity/pokemon_detail_home.dart';
import '../../domain/entity/pokemon_species.dart';
import '../../domain/usecases/get_all_pokemon_usecase.dart';
import '../../domain/usecases/get_pokemon_details_home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IGetAllPokemonsUseCase getAllPokemonsUseCase;
  final IGetPokemonDetailsUseCase getPokemonDetailsUseCase;

  var listPokemon = <Pokemon>[];
  var listPokemonDetail = <PokemonDetailHome>[];
  int offset = 0;

  HomeCubit({
    required this.getAllPokemonsUseCase,
    required this.getPokemonDetailsUseCase,
  }) : super(HomeInitial());

  Future<void> getAllPokemon(GetAllPokemonsDTO dto) async {
    final result = await getAllPokemonsUseCase(dto);

    result.fold(
      (success) {
        listPokemon = [...success];
      },
      (failure) {
        return emit(ErrorState());
      },
    );
  }

  Future<void> getPokemon() async {
    if (state is LoadingState) return;

    final currentState = state;

    var oldPokemon = <PokemonDetailHome>[];
    if (currentState is LoadedPokemonDetailState) {
      oldPokemon = currentState.listPokemon;
    }

    emit(
      LoadingState(
        oldPokemon: oldPokemon,
        isFirstFetch: offset == 0,
      ),
    );

    //primeira request
    final dto = GetAllPokemonsDTO(offset: offset);
    await getAllPokemon(dto);

    final list = listPokemon;

    final List<String> listName = list.map((v) => v.name).toList();
    GetPokemonDetailHomeDTO dto2 = GetPokemonDetailHomeDTO(listName: listName);

    // segunda request
    final result = await getPokemonDetailsUseCase(dto2);

    result.fold(
      (success) {
        offset += 10;
        final pokemons = (state as LoadingState).oldPokemon;
        pokemons.addAll(success);
        return emit(
          LoadedPokemonDetailState(
            listPokemon: pokemons,
          ),
        );
      },
      (failure) {
        return emit(ErrorState());
      },
    );
  }
}
