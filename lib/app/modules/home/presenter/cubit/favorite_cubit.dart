import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/dto/favorite_pokemon_dto.dart';
import '../../domain/entity/pokemon_detail_home.dart';
import '../../domain/usecases/store_favorite_pokemon_usecase.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final IStoreFavoritePokemonUseCase storeFavoritePokemonUseCase;

  FavoriteCubit({
    required this.storeFavoritePokemonUseCase,
  }) : super(FavoriteInitial());

  Future<void> storeFavorite(PokemonDetailHome pokemon) async {
    final dto = FavoritePokemonDTO(pokemon: pokemon);
    final result = await storeFavoritePokemonUseCase(dto);

    result.fold(
      (success) {
        emit(LoadedFavoriteState(pokemonDetail: success));
      },
      (failure) {
        return emit(ErrorFavoriteState());
      },
    );
  }
}
