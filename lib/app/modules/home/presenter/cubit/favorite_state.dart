part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {}

final class FavoriteInitial extends FavoriteState {
  @override
  List<Object> get props => [];
}

class LoadingFavoriteState extends FavoriteState {
  @override
  List<Object> get props => [];
}

class LoadedFavoriteState extends FavoriteState {
  LoadedFavoriteState({
    required this.listPokemonDetail,
  });

  final List<PokemonDetailHome> listPokemonDetail;

  @override
  List<Object> get props => [listPokemonDetail];
}

class StoredFavoriteState extends FavoriteState {
  StoredFavoriteState({
    required this.pokemon,
    this.isFavorite = false,
  });

  final PokemonDetailHome pokemon;
  final bool isFavorite;

  @override
  List<Object> get props => [
        pokemon,
        isFavorite,
      ];
}

class ErrorFavoriteState extends FavoriteState {
  @override
  List<Object> get props => [];
}
