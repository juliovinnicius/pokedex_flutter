part of 'home_cubit.dart';

abstract class HomeState extends Equatable {}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingState extends HomeState {
  LoadingState({
    required this.oldPokemon,
    this.isFirstFetch = false,
  });
  final List<PokemonDetailHome> oldPokemon;
  final bool isFirstFetch;
  @override
  List<Object> get props => [];
}

class LoadedPokemonDetailState extends HomeState {
  LoadedPokemonDetailState({required this.listPokemon});

  final List<PokemonDetailHome> listPokemon;

  @override
  List<Object> get props => [listPokemon];
}

// class LoadedMorePokemonState extends HomeState {
//   LoadedMorePokemonState(this.listPokemon);

//   final List<PokemonDetailHome> listPokemon;

//   @override
//   List<Object> get props => [listPokemon];
// }

class ErrorState extends HomeState {
  @override
  List<Object> get props => [];
}
