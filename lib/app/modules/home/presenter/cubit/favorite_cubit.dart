import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_flutter/app/modules/home/domain/usecases/get_pokemon_detail_favorite.dart';
import 'package:pokedex_flutter/app/modules/home/domain/usecases/remove_pokemon_favorite.dart';

import '../../domain/dto/favorite_pokemon_dto.dart';
import '../../domain/entity/pokemon_detail_home.dart';
import '../../domain/usecases/store_favorite_pokemon_usecase.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final IStoreFavoritePokemonUseCase storeFavoritePokemonUseCase;
  final IGetPokemonDetailsFavoriteUseCase getPokemonDetailsFavoriteUseCase;
  final IRemoveFavoritePokemonUseCase removeFavoritePokemonUseCase;

  FavoriteCubit({
    required this.storeFavoritePokemonUseCase,
    required this.getPokemonDetailsFavoriteUseCase,
    required this.removeFavoritePokemonUseCase,
  }) : super(FavoriteInitial());

  Future<void> storeFavorite(PokemonDetailHome pokemon) async {
    if (state is LoadingFavoriteState) return;

    final currentState = state;

    var listFavoritePokemon = <PokemonDetailHome>[];

    if (currentState is LoadedFavoriteState) {
      listFavoritePokemon = currentState.listPokemonDetail;
      listFavoritePokemon.add(pokemon);
    }

    emit(LoadingFavoriteState());

    final dto = FavoritePokemonDTO(pokemon: pokemon);
    final result = await storeFavoritePokemonUseCase(dto);

    result.fold(
      (success) {
        emit(
          LoadedFavoriteState(
            listPokemonDetail: listFavoritePokemon,
          ),
        );
      },
      (failure) {
        return emit(ErrorFavoriteState());
      },
    );
  }

  Future<void> getFavoritePokemon() async {
    if (state is LoadingFavoriteState) return;

    emit(
      LoadingFavoriteState(),
    );

    final result = await getPokemonDetailsFavoriteUseCase();

    result.fold(
      (success) {
        return emit(
          LoadedFavoriteState(
            listPokemonDetail: success,
          ),
        );
      },
      (failure) {
        return emit(ErrorFavoriteState());
      },
    );
  }

  Future<void> removePokemonFavorite(PokemonDetailHome pokemon) async {
    if (state is LoadingFavoriteState) return;

    final currentState = state;

    var oldListPokemon = <PokemonDetailHome>[];

    if (currentState is LoadedFavoriteState) {
      oldListPokemon = currentState.listPokemonDetail;
      oldListPokemon.removeWhere((poke) => poke.id == pokemon.id);
    }

    emit(LoadingFavoriteState());

    final dto = FavoritePokemonDTO(pokemon: pokemon);
    final result = await removeFavoritePokemonUseCase(dto);

    result.fold(
      (success) {
        emit(
          LoadedFavoriteState(
            listPokemonDetail: oldListPokemon,
          ),
        );
      },
      (failure) => emit(ErrorFavoriteState()),
    );
  }
}
