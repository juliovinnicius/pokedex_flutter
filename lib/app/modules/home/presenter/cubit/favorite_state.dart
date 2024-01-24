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
  LoadedFavoriteState({required this.pokemonDetail});

  final PokemonDetailHome pokemonDetail;

  @override
  List<Object> get props => [pokemonDetail];
}

class ErrorFavoriteState extends FavoriteState {
  @override
  List<Object> get props => [];
}
